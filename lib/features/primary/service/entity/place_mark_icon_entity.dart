import 'package:isar/isar.dart';
import 'package:map_tracker/features/primary/service/entity/entity.dart';

part 'place_mark_icon_entity.g.dart';

@Collection()
class PlaceMarkIconEntity {
  @Id()
  int? id;
  late String markerImageUrl;
  @Backlink(to: 'icon')
  final placeMarks = IsarLinks<PlaceMarkEntity>();
}