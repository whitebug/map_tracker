import 'package:xml/xml.dart';

/// Parse kml icons
class KmlStyle {
  /// [Style] id
  final String id;
  /// [IconStyle] icon
  final String icon;
  /// [ListStyle] list icon
  final String listIcon;

  KmlStyle({
    required this.id,
    required this.icon,
    required this.listIcon,
  });

  static List<KmlStyle> fromKmlToList(String kml) {
    final document = XmlDocument.parse(kml);
    final styles = document.findAllElements('Style');
    return styles.map((style) {
      final iconStyle = style.getElement('IconStyle');
      final icon = iconStyle?.getElement('Icon');
      final listStyle = style.getElement('ListStyle');
      final icon2 = listStyle?.getElement('ItemIcon');
      return KmlStyle(
        id: style.getAttribute('id') ?? 'id',
        icon: icon?.getElement('href')?.text ?? 'icon',
        listIcon: icon2?.getElement('href')?.text ?? 'listIcon',
      );
    }).toList(growable: false);
  }
}
