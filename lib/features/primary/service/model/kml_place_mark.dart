import 'package:map_tracker/features/primary/service/model/kml_look_at.dart';
import 'package:xml/xml.dart';

import 'kml_point.dart';

/// Details of some place at map
/// <Placemark>
///   <name>Тохорюкта (ПВЗ)</name>
///   <description>Наименование</description>
///   <LookAt>
///      <gx:TimeStamp>
///           <when>2018-10-03</when>
///      </gx:TimeStamp>
///      <gx:ViewerOptions>
///      <gx:option name="historicalimagery"></gx:option>
///      <gx:option enabled="0" name="sunlight"></gx:option>
///      <gx:option enabled="0" name="streetview"></gx:option>
///      </gx:ViewerOptions>
///      <longitude>109.2875023606387</longitude>
///      <latitude>52.55913041244802</latitude>
///      <altitude>0</altitude>
///      <heading>-2.079694331694673</heading>
///      <tilt>0</tilt>
///      <range>272.051161798341</range>
///      <gx:altitudeMode>relativeToSeaFloor</gx:altitudeMode>
///   </LookAt>
///   <styleUrl>#msn_U010</styleUrl>
///   <Point>
///      <gx:drawOrder>1</gx:drawOrder>
///      <coordinates>109.2867057103157,52.5590040783773,0</coordinates>
///   </Point>
/// </Placemark>
class KmlPlaceMark {
  final String name;
  final String description;
  final String styleUrl;
  final KmlPoint point;
  final KmlLookAt? lookAt;

  KmlPlaceMark({
    required this.name,
    required this.description,
    required this.styleUrl,
    required this.point,
    this.lookAt,
  });

  /// Get [KmlPlaceMark] list from kml
  static List<KmlPlaceMark> fromKmlToList(String kml) {
    final document = XmlDocument.parse(kml);
    final placeMarks = document.findAllElements('Placemark');
    return placeMarks.map((place) {
      return KmlPlaceMark(
        name: place.getElement('name')?.text?? '',
        description: place.getElement('description')?.text?? '',
        styleUrl: place.getElement('styleUrl')?.text?? '',
        point: KmlPoint.fromKml(place: place),
        lookAt: KmlLookAt.fromKml(place: place),
      );
    }).toList(growable: false);
  }
}