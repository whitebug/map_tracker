import 'package:xml/xml.dart';

///	<gx:option name="historicalimagery"></gx:option>
/// or
///	<gx:option enabled="0" name="sunlight"></gx:option>
class KmlOption {
  final String? name;
  final String? enabled;

  KmlOption({
    this.name,
    this.enabled,
  });

  /// Return list of [KmlOption] or null from parent [XmlElement] element [KmlLookAt]
  static List<KmlOption>? fromKmlToList({required XmlElement lookAt}) {
    final viewerOptions = lookAt.getElement('gx:ViewerOptions');
    final options = viewerOptions?.children;
    if (options != null) {
      List<KmlOption> kmlOptionList = [];
      for (int i = 0; i < options.length; i++) {
        final name = options[i].getAttribute('name');
        final enabled = options[i].getAttribute('enabled');
        if (name != null || enabled != null) {
          kmlOptionList.add(KmlOption(
            name: name,
            enabled: enabled,
          ));
        }
      }
      return kmlOptionList;
    }
    return null;
  }
}