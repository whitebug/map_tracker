import 'package:xml/xml.dart';

/// <Point>
/// <coordinates>109.2013108617127,52.11302538047238,629.3</coordinates>
/// </Point>
///
/// or
///
/// <Point>
/// <gx:drawOrder>1</gx:drawOrder>
/// <coordinates>109.2867057103157,52.5590040783773,0</coordinates>
/// </Point>
class KmlPoint {
  final List<double>? coordinates;
  final int? drawOrder;

  KmlPoint({
    required this.coordinates,
    this.drawOrder,
  });

  /// Get [KmlPoint] from [XmlElement] element [KmlPlaceMark]
  factory KmlPoint.fromKml({required XmlElement place}) {
    final point = place.getElement('Point');
    final coordinates = point?.getElement('coordinates')?.text.split(',');
    return KmlPoint(
      drawOrder: point?.getElement('gx:drawOrder')?.text == null
          ? null
          : int.parse(point?.getElement('gx:drawOrder')?.text ?? '0'),
      coordinates: coordinates?.map((coordinate) => double.parse(coordinate)).toList(growable: false),
    );
  }
}
