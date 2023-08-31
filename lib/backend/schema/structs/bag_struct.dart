// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BagStruct extends FFFirebaseStruct {
  BagStruct({
    String? description,
    bool? active,
    String? name,
    String? category,
    DateTime? timeStart,
    DateTime? timeEnd,
    int? amount,
    int? sold,
    int? priceInt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _description = description,
        _active = active,
        _name = name,
        _category = category,
        _timeStart = timeStart,
        _timeEnd = timeEnd,
        _amount = amount,
        _sold = sold,
        _priceInt = priceInt,
        super(firestoreUtilData);

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;
  bool hasActive() => _active != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  // "time_start" field.
  DateTime? _timeStart;
  DateTime? get timeStart => _timeStart;
  set timeStart(DateTime? val) => _timeStart = val;
  bool hasTimeStart() => _timeStart != null;

  // "time_end" field.
  DateTime? _timeEnd;
  DateTime? get timeEnd => _timeEnd;
  set timeEnd(DateTime? val) => _timeEnd = val;
  bool hasTimeEnd() => _timeEnd != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;
  void incrementAmount(int amount) => _amount = amount + amount;
  bool hasAmount() => _amount != null;

  // "sold" field.
  int? _sold;
  int get sold => _sold ?? 0;
  set sold(int? val) => _sold = val;
  void incrementSold(int amount) => _sold = sold + amount;
  bool hasSold() => _sold != null;

  // "price_int" field.
  int? _priceInt;
  int get priceInt => _priceInt ?? 0;
  set priceInt(int? val) => _priceInt = val;
  void incrementPriceInt(int amount) => _priceInt = priceInt + amount;
  bool hasPriceInt() => _priceInt != null;

  static BagStruct fromMap(Map<String, dynamic> data) => BagStruct(
        description: data['description'] as String?,
        active: data['active'] as bool?,
        name: data['name'] as String?,
        category: data['category'] as String?,
        timeStart: data['time_start'] as DateTime?,
        timeEnd: data['time_end'] as DateTime?,
        amount: castToType<int>(data['amount']),
        sold: castToType<int>(data['sold']),
        priceInt: castToType<int>(data['price_int']),
      );

  static BagStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? BagStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'description': _description,
        'active': _active,
        'name': _name,
        'category': _category,
        'time_start': _timeStart,
        'time_end': _timeEnd,
        'amount': _amount,
        'sold': _sold,
        'price_int': _priceInt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'time_start': serializeParam(
          _timeStart,
          ParamType.DateTime,
        ),
        'time_end': serializeParam(
          _timeEnd,
          ParamType.DateTime,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'sold': serializeParam(
          _sold,
          ParamType.int,
        ),
        'price_int': serializeParam(
          _priceInt,
          ParamType.int,
        ),
      }.withoutNulls;

  static BagStruct fromSerializableMap(Map<String, dynamic> data) => BagStruct(
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        timeStart: deserializeParam(
          data['time_start'],
          ParamType.DateTime,
          false,
        ),
        timeEnd: deserializeParam(
          data['time_end'],
          ParamType.DateTime,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        sold: deserializeParam(
          data['sold'],
          ParamType.int,
          false,
        ),
        priceInt: deserializeParam(
          data['price_int'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BagStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BagStruct &&
        description == other.description &&
        active == other.active &&
        name == other.name &&
        category == other.category &&
        timeStart == other.timeStart &&
        timeEnd == other.timeEnd &&
        amount == other.amount &&
        sold == other.sold &&
        priceInt == other.priceInt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        description,
        active,
        name,
        category,
        timeStart,
        timeEnd,
        amount,
        sold,
        priceInt
      ]);
}

BagStruct createBagStruct({
  String? description,
  bool? active,
  String? name,
  String? category,
  DateTime? timeStart,
  DateTime? timeEnd,
  int? amount,
  int? sold,
  int? priceInt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BagStruct(
      description: description,
      active: active,
      name: name,
      category: category,
      timeStart: timeStart,
      timeEnd: timeEnd,
      amount: amount,
      sold: sold,
      priceInt: priceInt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BagStruct? updateBagStruct(
  BagStruct? bag, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bag
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBagStructData(
  Map<String, dynamic> firestoreData,
  BagStruct? bag,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bag == null) {
    return;
  }
  if (bag.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && bag.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bagData = getBagFirestoreData(bag, forFieldValue);
  final nestedData = bagData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bag.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBagFirestoreData(
  BagStruct? bag, [
  bool forFieldValue = false,
]) {
  if (bag == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bag.toMap());

  // Add any Firestore field values
  bag.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBagListFirestoreData(
  List<BagStruct>? bags,
) =>
    bags?.map((e) => getBagFirestoreData(e, true)).toList() ?? [];
