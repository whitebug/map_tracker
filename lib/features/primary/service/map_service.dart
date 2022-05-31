import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:isar/isar.dart';
import 'package:map_tracker/features/primary/service/entity/entity.dart';

import 'model/kml_place_mark.dart';
import 'model/kml_style.dart';
import 'model/kml_style_map.dart';

class MapService {
  Future<String?> getKml() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    final _appDataDir = Directory.systemTemp;
    if (result != null) {
      File kmz = File(result.files.single.path!);
      final String dirName = '${_appDataDir.path}/unzip';
      final destinationDir = Directory(dirName);
      if (destinationDir.existsSync()) {
        // Deleting existing unzip directory
        destinationDir.deleteSync(recursive: true);
      }
      destinationDir.createSync();
      // test concurrent extraction
      final extractFutures = <Future>[];
      try {
        extractFutures.add(
          ZipFile.extractToDirectory(
            zipFile: kmz,
            destinationDir: destinationDir,
          ),
        );
        await Future.wait<void>(extractFutures);
        File file = File('$dirName/doc.kml');
        return await file.readAsString();
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Sort [KmlPlaceMark] by [styleUrl] which is a key for marker type
  Map<String, List<KmlPlaceMark>> sortPlaceMarks({required List<KmlPlaceMark> kmlPlaceMarks}) {
    Map<String, List<KmlPlaceMark>> sortedPlaceMarks = {};
    for (int i = 0; i < kmlPlaceMarks.length; i++) {
      final KmlPlaceMark mark = kmlPlaceMarks[i];
      final String _currentStyleUrl = mark.styleUrl.replaceAll('#', '');
      if (sortedPlaceMarks[_currentStyleUrl] != null) {
        List<KmlPlaceMark> list = sortedPlaceMarks[_currentStyleUrl]!;
        list.add(mark);
        sortedPlaceMarks[_currentStyleUrl] = list;
      } else {
        sortedPlaceMarks[_currentStyleUrl] = [mark];
      }
    }
    return sortedPlaceMarks;
  }

  /// Get url for marker
  String getMarkerUrl({
    /// Required [KmlStyle] id
    required String styleUrl,

    /// List of all [KmlPlaceMark]
    required List<KmlPlaceMark> kmlPlaceMarks,

    /// List of all [KmlStyle] to get required [KmlStyleMap]
    required List<KmlStyle> styles,

    /// List of all [KmlStyleMap] to get marker's image url
    required List<KmlStyleMap> styleMaps,
  }) {
    final kStyleMap = styleMaps.firstWhere((element) => element.id == styleUrl);
    final kStyle1 = kStyleMap.styleUrl1.replaceAll('#', '');
    //final kStyle2 = kStyleMap.styleUrl2.replaceAll('#', '');
    final style1 = styles.firstWhere((element) => element.id == kStyle1);
    //final style2 = styles.firstWhere((element) => element.id == kStyle2);
    return style1.icon;
  }

  /// Read markers to database using kmz format of importing file
  Future<void> readKmzToDataBase({
    required Isar database,
  }) async {
    String? kml = await getKml();
    if (kml != null) {
      List<KmlStyle> styles = KmlStyle.fromKmlToList(kml);
      List<KmlStyleMap> styleMaps = KmlStyleMap.fromKmlToList(kml);
      List<KmlPlaceMark> kmlPlaceMarks = KmlPlaceMark.fromKmlToList(kml);
      Map<String, List<KmlPlaceMark>> sortedPlaceMarks = sortPlaceMarks(kmlPlaceMarks: kmlPlaceMarks);
      List<String> styleUrls = sortedPlaceMarks.keys.toList(growable: false);
      for (int i = 0; i < styleUrls.length; i++) {
        final markerImageUrl = getMarkerUrl(
          styleUrl: styleUrls[i],
          styles: styles,
          styleMaps: styleMaps,
          kmlPlaceMarks: kmlPlaceMarks,
        );
        final List<KmlPlaceMark> list = sortedPlaceMarks[styleUrls[i]] ?? [];
        if (list.isNotEmpty) {
          for (int i = 0; i < list.length; i++) {
            final KmlPlaceMark currentKml = list[i];
            final coordinates = currentKml.point.coordinates;
            if (coordinates != null) {
              final placeMark = PlaceMarkEntity()
                ..name = currentKml.name
                ..description = currentKml.description
                ..styleUrl = currentKml.styleUrl
                ..latitude = coordinates[1]
                ..longitude = coordinates[0]
                ..icon = markerImageUrl;
              database.writeTxn((isar) async {
                await isar.placeMarkEntitys.put(placeMark);
              });
            }
          }
        }
      }
    }
  }

  /// Delete all existing markers from the database
  Future<void> deleteMarkersFromDatabase({
    required Isar database,
  }) async {
    final List<PlaceMarkEntity> markers = await database.placeMarkEntitys.where().findAll();
    await database.writeTxn((isar) async {
      final List<int> ids = markers.map((e) => e.id!).toList();
      await database.placeMarkEntitys.deleteAll(ids);
    });
  }
}
