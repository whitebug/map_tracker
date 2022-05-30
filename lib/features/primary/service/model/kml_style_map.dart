import 'package:xml/xml.dart';

/// Data for [StyleMap] of KML
class KmlStyleMap {
  final String id;
  final String key1;
  final String styleUrl1;
  final String key2;
  final String styleUrl2;

  KmlStyleMap({
    required this.id,
    required this.key1,
    required this.styleUrl1,
    required this.key2,
    required this.styleUrl2,
  });

  static List<KmlStyleMap> fromKmlToList(String kml) {
    final document = XmlDocument.parse(kml);
    final styleMaps = document.findAllElements('StyleMap');
    return styleMaps.map((styleMap) {
      final pairs = styleMap.findAllElements('Pair');
      return KmlStyleMap(
        id: styleMap.getAttribute('id') ?? 'id',
        key1: pairs.first.getElement('key')?.text ?? 'key',
        styleUrl1: pairs.first.getElement('styleUrl')?.text ?? 'styleUrl',
        key2: pairs.last.getElement('key')?.text ?? 'key',
        styleUrl2: pairs.last.getElement('styleUrl')?.text ?? 'styleUrl',
      );
    }).toList(growable: false);
  }
}
