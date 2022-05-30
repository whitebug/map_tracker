import 'package:isar/isar.dart';

part 'place_mark_entity.g.dart';

/// Database representation for [KmlPlaceMark]
@Collection()
class PlaceMarkEntity {
  @Id()
  int? id;
  late String name;
  late String description;
  late String styleUrl;
  late double longitude;
  late double latitude;
  late String icon;
}