import 'package:map_tracker/features/primary/service/model/kml_option.dart';
import 'package:xml/xml.dart';
import 'package:intl/intl.dart';

/// <LookAt>
///	<gx:TimeStamp>
///   <when>2018-10-19</when>
/// </gx:TimeStamp>
///	<gx:ViewerOptions>
///		<gx:option name="historicalimagery"></gx:option>
///		<gx:option enabled="0" name="sunlight"></gx:option>
///		<gx:option enabled="0" name="streetview"></gx:option>
///	</gx:ViewerOptions>
///	<longitude>109.8249845939733</longitude>
///	<latitude>52.27089275780028</latitude>
///	<altitude>0</altitude>
///	<heading>3.091474583826204</heading>
///	<tilt>0</tilt>
///	<range>341.6006066779191</range>
///	<gx:altitudeMode>relativeToSeaFloor</gx:altitudeMode>
///</LookAt>
class KmlLookAt {
  final double longitude;
  final double latitude;
  final double altitude;
  final double heading;
  final double tilt;
  final double range;
  final String? altitudeMode;
  final DateTime? timeStamp;
  final List<KmlOption>? viewerOptions;

  KmlLookAt({
    required this.longitude,
    required this.latitude,
    required this.altitude,
    required this.heading,
    required this.tilt,
    required this.range,
    this.altitudeMode,
    this.timeStamp,
    this.viewerOptions,
  });

  /// Return [KmlLookAt] or null from parent [XmlElement] element [KmlPlaceMark]
  static KmlLookAt? fromKml({required XmlElement place}) {
    final lookAt = place.getElement('LookAt');
    if (lookAt != null) {
      final timeStamp = lookAt.getElement('gx:TimeStamp');
      final when = timeStamp?.getElement('when')?.text;
      if (when != null) {
        DateTime? timeStamp;
        try {
          timeStamp = DateTime.parse(when);
        } on FormatException {
          DateFormat format = DateFormat('yyyy-mm');
          timeStamp = format.parse(when);
        }
        return KmlLookAt(
          longitude: double.parse(lookAt.getElement('longitude')!.text),
          latitude: double.parse(lookAt.getElement('latitude')!.text),
          altitude: double.parse(lookAt.getElement('altitude')!.text),
          heading: double.parse(lookAt.getElement('heading')!.text),
          tilt: double.parse(lookAt.getElement('tilt')!.text),
          range: double.parse(lookAt.getElement('range')!.text),
          altitudeMode: lookAt.getElement('gx:altitudeMode')?.text,
          timeStamp: timeStamp,
          viewerOptions: KmlOption.fromKmlToList(lookAt: lookAt),
        );
      }
    }
    return null;
  }
}