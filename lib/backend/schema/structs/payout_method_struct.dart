// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PayoutMethodStruct extends FFFirebaseStruct {
  PayoutMethodStruct({
    String? accountNumber,
    String? bankName,
    String? accountNameHolder,
    bool? verified,
    String? city,
    String? postalcode,
    String? address,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accountNumber = accountNumber,
        _bankName = bankName,
        _accountNameHolder = accountNameHolder,
        _verified = verified,
        _city = city,
        _postalcode = postalcode,
        _address = address,
        super(firestoreUtilData);

  // "account_number" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  set accountNumber(String? val) => _accountNumber = val;
  bool hasAccountNumber() => _accountNumber != null;

  // "bank_name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  set bankName(String? val) => _bankName = val;
  bool hasBankName() => _bankName != null;

  // "account_name_holder" field.
  String? _accountNameHolder;
  String get accountNameHolder => _accountNameHolder ?? '';
  set accountNameHolder(String? val) => _accountNameHolder = val;
  bool hasAccountNameHolder() => _accountNameHolder != null;

  // "verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  set verified(bool? val) => _verified = val;
  bool hasVerified() => _verified != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "postalcode" field.
  String? _postalcode;
  String get postalcode => _postalcode ?? '';
  set postalcode(String? val) => _postalcode = val;
  bool hasPostalcode() => _postalcode != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  static PayoutMethodStruct fromMap(Map<String, dynamic> data) =>
      PayoutMethodStruct(
        accountNumber: data['account_number'] as String?,
        bankName: data['bank_name'] as String?,
        accountNameHolder: data['account_name_holder'] as String?,
        verified: data['verified'] as bool?,
        city: data['city'] as String?,
        postalcode: data['postalcode'] as String?,
        address: data['address'] as String?,
      );

  static PayoutMethodStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PayoutMethodStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'account_number': _accountNumber,
        'bank_name': _bankName,
        'account_name_holder': _accountNameHolder,
        'verified': _verified,
        'city': _city,
        'postalcode': _postalcode,
        'address': _address,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'account_number': serializeParam(
          _accountNumber,
          ParamType.String,
        ),
        'bank_name': serializeParam(
          _bankName,
          ParamType.String,
        ),
        'account_name_holder': serializeParam(
          _accountNameHolder,
          ParamType.String,
        ),
        'verified': serializeParam(
          _verified,
          ParamType.bool,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'postalcode': serializeParam(
          _postalcode,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
      }.withoutNulls;

  static PayoutMethodStruct fromSerializableMap(Map<String, dynamic> data) =>
      PayoutMethodStruct(
        accountNumber: deserializeParam(
          data['account_number'],
          ParamType.String,
          false,
        ),
        bankName: deserializeParam(
          data['bank_name'],
          ParamType.String,
          false,
        ),
        accountNameHolder: deserializeParam(
          data['account_name_holder'],
          ParamType.String,
          false,
        ),
        verified: deserializeParam(
          data['verified'],
          ParamType.bool,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        postalcode: deserializeParam(
          data['postalcode'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PayoutMethodStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PayoutMethodStruct &&
        accountNumber == other.accountNumber &&
        bankName == other.bankName &&
        accountNameHolder == other.accountNameHolder &&
        verified == other.verified &&
        city == other.city &&
        postalcode == other.postalcode &&
        address == other.address;
  }

  @override
  int get hashCode => const ListEquality().hash([
        accountNumber,
        bankName,
        accountNameHolder,
        verified,
        city,
        postalcode,
        address
      ]);
}

PayoutMethodStruct createPayoutMethodStruct({
  String? accountNumber,
  String? bankName,
  String? accountNameHolder,
  bool? verified,
  String? city,
  String? postalcode,
  String? address,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PayoutMethodStruct(
      accountNumber: accountNumber,
      bankName: bankName,
      accountNameHolder: accountNameHolder,
      verified: verified,
      city: city,
      postalcode: postalcode,
      address: address,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PayoutMethodStruct? updatePayoutMethodStruct(
  PayoutMethodStruct? payoutMethod, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    payoutMethod
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPayoutMethodStructData(
  Map<String, dynamic> firestoreData,
  PayoutMethodStruct? payoutMethod,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (payoutMethod == null) {
    return;
  }
  if (payoutMethod.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && payoutMethod.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final payoutMethodData =
      getPayoutMethodFirestoreData(payoutMethod, forFieldValue);
  final nestedData =
      payoutMethodData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = payoutMethod.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPayoutMethodFirestoreData(
  PayoutMethodStruct? payoutMethod, [
  bool forFieldValue = false,
]) {
  if (payoutMethod == null) {
    return {};
  }
  final firestoreData = mapToFirestore(payoutMethod.toMap());

  // Add any Firestore field values
  payoutMethod.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPayoutMethodListFirestoreData(
  List<PayoutMethodStruct>? payoutMethods,
) =>
    payoutMethods?.map((e) => getPayoutMethodFirestoreData(e, true)).toList() ??
    [];
