import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_archive/flutter_archive.dart';

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
}
