// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_mark_icon_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetPlaceMarkIconEntityCollection on Isar {
  IsarCollection<PlaceMarkIconEntity> get placeMarkIconEntitys =>
      getCollection();
}

const PlaceMarkIconEntitySchema = CollectionSchema(
  name: 'PlaceMarkIconEntity',
  schema:
      '{"name":"PlaceMarkIconEntity","idName":"id","properties":[{"name":"markerImageUrl","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'markerImageUrl': 0},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'placeMarks': 0},
  backlinkLinkNames: {'placeMarks': 'icon'},
  getId: _placeMarkIconEntityGetId,
  setId: _placeMarkIconEntitySetId,
  getLinks: _placeMarkIconEntityGetLinks,
  attachLinks: _placeMarkIconEntityAttachLinks,
  serializeNative: _placeMarkIconEntitySerializeNative,
  deserializeNative: _placeMarkIconEntityDeserializeNative,
  deserializePropNative: _placeMarkIconEntityDeserializePropNative,
  serializeWeb: _placeMarkIconEntitySerializeWeb,
  deserializeWeb: _placeMarkIconEntityDeserializeWeb,
  deserializePropWeb: _placeMarkIconEntityDeserializePropWeb,
  version: 3,
);

int? _placeMarkIconEntityGetId(PlaceMarkIconEntity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _placeMarkIconEntitySetId(PlaceMarkIconEntity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _placeMarkIconEntityGetLinks(PlaceMarkIconEntity object) {
  return [object.placeMarks];
}

void _placeMarkIconEntitySerializeNative(
    IsarCollection<PlaceMarkIconEntity> collection,
    IsarRawObject rawObj,
    PlaceMarkIconEntity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.markerImageUrl;
  final _markerImageUrl = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_markerImageUrl.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _markerImageUrl);
}

PlaceMarkIconEntity _placeMarkIconEntityDeserializeNative(
    IsarCollection<PlaceMarkIconEntity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = PlaceMarkIconEntity();
  object.id = id;
  object.markerImageUrl = reader.readString(offsets[0]);
  _placeMarkIconEntityAttachLinks(collection, id, object);
  return object;
}

P _placeMarkIconEntityDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _placeMarkIconEntitySerializeWeb(
    IsarCollection<PlaceMarkIconEntity> collection,
    PlaceMarkIconEntity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'markerImageUrl', object.markerImageUrl);
  return jsObj;
}

PlaceMarkIconEntity _placeMarkIconEntityDeserializeWeb(
    IsarCollection<PlaceMarkIconEntity> collection, dynamic jsObj) {
  final object = PlaceMarkIconEntity();
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.markerImageUrl = IsarNative.jsObjectGet(jsObj, 'markerImageUrl') ?? '';
  _placeMarkIconEntityAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _placeMarkIconEntityDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'markerImageUrl':
      return (IsarNative.jsObjectGet(jsObj, 'markerImageUrl') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _placeMarkIconEntityAttachLinks(
    IsarCollection col, int id, PlaceMarkIconEntity object) {
  object.placeMarks.attach(col, col.isar.placeMarkEntitys, 'placeMarks', id);
}

extension PlaceMarkIconEntityQueryWhereSort
    on QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QWhere> {
  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension PlaceMarkIconEntityQueryWhere
    on QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QWhereClause> {
  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterWhereClause>
      idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension PlaceMarkIconEntityQueryFilter on QueryBuilder<PlaceMarkIconEntity,
    PlaceMarkIconEntity, QFilterCondition> {
  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      markerImageUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'markerImageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      markerImageUrlGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'markerImageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      markerImageUrlLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'markerImageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      markerImageUrlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'markerImageUrl',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      markerImageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'markerImageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      markerImageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'markerImageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      markerImageUrlContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'markerImageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      markerImageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'markerImageUrl',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension PlaceMarkIconEntityQueryLinks on QueryBuilder<PlaceMarkIconEntity,
    PlaceMarkIconEntity, QFilterCondition> {
  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterFilterCondition>
      placeMarks(FilterQuery<PlaceMarkEntity> q) {
    return linkInternal(
      isar.placeMarkEntitys,
      q,
      'placeMarks',
    );
  }
}

extension PlaceMarkIconEntityQueryWhereSortBy
    on QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QSortBy> {
  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterSortBy>
      sortByMarkerImageUrl() {
    return addSortByInternal('markerImageUrl', Sort.asc);
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterSortBy>
      sortByMarkerImageUrlDesc() {
    return addSortByInternal('markerImageUrl', Sort.desc);
  }
}

extension PlaceMarkIconEntityQueryWhereSortThenBy
    on QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QSortThenBy> {
  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterSortBy>
      thenByMarkerImageUrl() {
    return addSortByInternal('markerImageUrl', Sort.asc);
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QAfterSortBy>
      thenByMarkerImageUrlDesc() {
    return addSortByInternal('markerImageUrl', Sort.desc);
  }
}

extension PlaceMarkIconEntityQueryWhereDistinct
    on QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QDistinct> {
  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QDistinct>
      distinctByMarkerImageUrl({bool caseSensitive = true}) {
    return addDistinctByInternal('markerImageUrl',
        caseSensitive: caseSensitive);
  }
}

extension PlaceMarkIconEntityQueryProperty
    on QueryBuilder<PlaceMarkIconEntity, PlaceMarkIconEntity, QQueryProperty> {
  QueryBuilder<PlaceMarkIconEntity, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<PlaceMarkIconEntity, String, QQueryOperations>
      markerImageUrlProperty() {
    return addPropertyNameInternal('markerImageUrl');
  }
}
