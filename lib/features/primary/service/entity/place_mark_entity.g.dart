// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_mark_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetPlaceMarkEntityCollection on Isar {
  IsarCollection<PlaceMarkEntity> get placeMarkEntitys => getCollection();
}

const PlaceMarkEntitySchema = CollectionSchema(
  name: 'PlaceMarkEntity',
  schema:
      '{"name":"PlaceMarkEntity","idName":"id","properties":[{"name":"description","type":"String"},{"name":"icon","type":"String"},{"name":"latitude","type":"Double"},{"name":"longitude","type":"Double"},{"name":"name","type":"String"},{"name":"styleUrl","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'description': 0,
    'icon': 1,
    'latitude': 2,
    'longitude': 3,
    'name': 4,
    'styleUrl': 5
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _placeMarkEntityGetId,
  setId: _placeMarkEntitySetId,
  getLinks: _placeMarkEntityGetLinks,
  attachLinks: _placeMarkEntityAttachLinks,
  serializeNative: _placeMarkEntitySerializeNative,
  deserializeNative: _placeMarkEntityDeserializeNative,
  deserializePropNative: _placeMarkEntityDeserializePropNative,
  serializeWeb: _placeMarkEntitySerializeWeb,
  deserializeWeb: _placeMarkEntityDeserializeWeb,
  deserializePropWeb: _placeMarkEntityDeserializePropWeb,
  version: 3,
);

int? _placeMarkEntityGetId(PlaceMarkEntity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _placeMarkEntitySetId(PlaceMarkEntity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _placeMarkEntityGetLinks(PlaceMarkEntity object) {
  return [];
}

void _placeMarkEntitySerializeNative(
    IsarCollection<PlaceMarkEntity> collection,
    IsarRawObject rawObj,
    PlaceMarkEntity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.description;
  final _description = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_description.length) as int;
  final value1 = object.icon;
  final _icon = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_icon.length) as int;
  final value2 = object.latitude;
  final _latitude = value2;
  final value3 = object.longitude;
  final _longitude = value3;
  final value4 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_name.length) as int;
  final value5 = object.styleUrl;
  final _styleUrl = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_styleUrl.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _description);
  writer.writeBytes(offsets[1], _icon);
  writer.writeDouble(offsets[2], _latitude);
  writer.writeDouble(offsets[3], _longitude);
  writer.writeBytes(offsets[4], _name);
  writer.writeBytes(offsets[5], _styleUrl);
}

PlaceMarkEntity _placeMarkEntityDeserializeNative(
    IsarCollection<PlaceMarkEntity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = PlaceMarkEntity();
  object.description = reader.readString(offsets[0]);
  object.icon = reader.readString(offsets[1]);
  object.id = id;
  object.latitude = reader.readDouble(offsets[2]);
  object.longitude = reader.readDouble(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.styleUrl = reader.readString(offsets[5]);
  return object;
}

P _placeMarkEntityDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _placeMarkEntitySerializeWeb(
    IsarCollection<PlaceMarkEntity> collection, PlaceMarkEntity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'description', object.description);
  IsarNative.jsObjectSet(jsObj, 'icon', object.icon);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'latitude', object.latitude);
  IsarNative.jsObjectSet(jsObj, 'longitude', object.longitude);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'styleUrl', object.styleUrl);
  return jsObj;
}

PlaceMarkEntity _placeMarkEntityDeserializeWeb(
    IsarCollection<PlaceMarkEntity> collection, dynamic jsObj) {
  final object = PlaceMarkEntity();
  object.description = IsarNative.jsObjectGet(jsObj, 'description') ?? '';
  object.icon = IsarNative.jsObjectGet(jsObj, 'icon') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.latitude =
      IsarNative.jsObjectGet(jsObj, 'latitude') ?? double.negativeInfinity;
  object.longitude =
      IsarNative.jsObjectGet(jsObj, 'longitude') ?? double.negativeInfinity;
  object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
  object.styleUrl = IsarNative.jsObjectGet(jsObj, 'styleUrl') ?? '';
  return object;
}

P _placeMarkEntityDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'description':
      return (IsarNative.jsObjectGet(jsObj, 'description') ?? '') as P;
    case 'icon':
      return (IsarNative.jsObjectGet(jsObj, 'icon') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'latitude':
      return (IsarNative.jsObjectGet(jsObj, 'latitude') ??
          double.negativeInfinity) as P;
    case 'longitude':
      return (IsarNative.jsObjectGet(jsObj, 'longitude') ??
          double.negativeInfinity) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'styleUrl':
      return (IsarNative.jsObjectGet(jsObj, 'styleUrl') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _placeMarkEntityAttachLinks(
    IsarCollection col, int id, PlaceMarkEntity object) {}

extension PlaceMarkEntityQueryWhereSort
    on QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QWhere> {
  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension PlaceMarkEntityQueryWhere
    on QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QWhereClause> {
  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterWhereClause>
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

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterWhereClause> idBetween(
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

extension PlaceMarkEntityQueryFilter
    on QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QFilterCondition> {
  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'description',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'description',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      iconEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      iconGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      iconLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      iconBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'icon',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      iconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      iconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      iconContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'icon',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      iconMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'icon',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
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

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
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

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
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

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      latitudeGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'latitude',
      value: value,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      latitudeLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'latitude',
      value: value,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      latitudeBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'latitude',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      longitudeGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'longitude',
      value: value,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      longitudeLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'longitude',
      value: value,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      longitudeBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'longitude',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      styleUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'styleUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      styleUrlGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'styleUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      styleUrlLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'styleUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      styleUrlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'styleUrl',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      styleUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'styleUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      styleUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'styleUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      styleUrlContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'styleUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterFilterCondition>
      styleUrlMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'styleUrl',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension PlaceMarkEntityQueryLinks
    on QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QFilterCondition> {}

extension PlaceMarkEntityQueryWhereSortBy
    on QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QSortBy> {
  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy> sortByIcon() {
    return addSortByInternal('icon', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      sortByIconDesc() {
    return addSortByInternal('icon', Sort.desc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      sortByLatitude() {
    return addSortByInternal('latitude', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      sortByLatitudeDesc() {
    return addSortByInternal('latitude', Sort.desc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      sortByLongitude() {
    return addSortByInternal('longitude', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      sortByLongitudeDesc() {
    return addSortByInternal('longitude', Sort.desc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      sortByStyleUrl() {
    return addSortByInternal('styleUrl', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      sortByStyleUrlDesc() {
    return addSortByInternal('styleUrl', Sort.desc);
  }
}

extension PlaceMarkEntityQueryWhereSortThenBy
    on QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QSortThenBy> {
  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy> thenByIcon() {
    return addSortByInternal('icon', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      thenByIconDesc() {
    return addSortByInternal('icon', Sort.desc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      thenByLatitude() {
    return addSortByInternal('latitude', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      thenByLatitudeDesc() {
    return addSortByInternal('latitude', Sort.desc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      thenByLongitude() {
    return addSortByInternal('longitude', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      thenByLongitudeDesc() {
    return addSortByInternal('longitude', Sort.desc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      thenByStyleUrl() {
    return addSortByInternal('styleUrl', Sort.asc);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QAfterSortBy>
      thenByStyleUrlDesc() {
    return addSortByInternal('styleUrl', Sort.desc);
  }
}

extension PlaceMarkEntityQueryWhereDistinct
    on QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QDistinct> {
  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QDistinct> distinctByIcon(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('icon', caseSensitive: caseSensitive);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QDistinct>
      distinctByLatitude() {
    return addDistinctByInternal('latitude');
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QDistinct>
      distinctByLongitude() {
    return addDistinctByInternal('longitude');
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QDistinct> distinctByStyleUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('styleUrl', caseSensitive: caseSensitive);
  }
}

extension PlaceMarkEntityQueryProperty
    on QueryBuilder<PlaceMarkEntity, PlaceMarkEntity, QQueryProperty> {
  QueryBuilder<PlaceMarkEntity, String, QQueryOperations>
      descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<PlaceMarkEntity, String, QQueryOperations> iconProperty() {
    return addPropertyNameInternal('icon');
  }

  QueryBuilder<PlaceMarkEntity, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<PlaceMarkEntity, double, QQueryOperations> latitudeProperty() {
    return addPropertyNameInternal('latitude');
  }

  QueryBuilder<PlaceMarkEntity, double, QQueryOperations> longitudeProperty() {
    return addPropertyNameInternal('longitude');
  }

  QueryBuilder<PlaceMarkEntity, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<PlaceMarkEntity, String, QQueryOperations> styleUrlProperty() {
    return addPropertyNameInternal('styleUrl');
  }
}
