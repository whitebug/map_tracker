import 'package:isar/isar.dart';
import 'package:map_tracker/features/primary/service/entity/entity.dart';

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
  final icon = IsarLink<PlaceMarkIconEntity>();
}