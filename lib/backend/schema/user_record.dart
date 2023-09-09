import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "store_verified" field.
  bool? _storeVerified;
  bool get storeVerified => _storeVerified ?? false;
  bool hasStoreVerified() => _storeVerified != null;

  // "store" field.
  bool? _store;
  bool get store => _store ?? false;
  bool hasStore() => _store != null;

  // "store_ref" field.
  DocumentReference? _storeRef;
  DocumentReference? get storeRef => _storeRef;
  bool hasStoreRef() => _storeRef != null;

  // "UI" field.
  bool? _ui;
  bool get ui => _ui ?? false;
  bool hasUi() => _ui != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "wallet" field.
  double? _wallet;
  double get wallet => _wallet ?? 0.0;
  bool hasWallet() => _wallet != null;

  // "co2" field.
  double? _co2;
  double get co2 => _co2 ?? 0.0;
  bool hasCo2() => _co2 != null;

  // "food_kg" field.
  double? _foodKg;
  double get foodKg => _foodKg ?? 0.0;
  bool hasFoodKg() => _foodKg != null;

  // "money_saved" field.
  double? _moneySaved;
  double get moneySaved => _moneySaved ?? 0.0;
  bool hasMoneySaved() => _moneySaved != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _country = snapshotData['country'] as String?;
    _storeVerified = snapshotData['store_verified'] as bool?;
    _store = snapshotData['store'] as bool?;
    _storeRef = snapshotData['store_ref'] as DocumentReference?;
    _ui = snapshotData['UI'] as bool?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _wallet = castToType<double>(snapshotData['wallet']);
    _co2 = castToType<double>(snapshotData['co2']);
    _foodKg = castToType<double>(snapshotData['food_kg']);
    _moneySaved = castToType<double>(snapshotData['money_saved']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? country,
  bool? storeVerified,
  bool? store,
  DocumentReference? storeRef,
  bool? ui,
  String? phoneNumber,
  double? wallet,
  double? co2,
  double? foodKg,
  double? moneySaved,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'country': country,
      'store_verified': storeVerified,
      'store': store,
      'store_ref': storeRef,
      'UI': ui,
      'phone_number': phoneNumber,
      'wallet': wallet,
      'co2': co2,
      'food_kg': foodKg,
      'money_saved': moneySaved,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.country == e2?.country &&
        e1?.storeVerified == e2?.storeVerified &&
        e1?.store == e2?.store &&
        e1?.storeRef == e2?.storeRef &&
        e1?.ui == e2?.ui &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.wallet == e2?.wallet &&
        e1?.co2 == e2?.co2 &&
        e1?.foodKg == e2?.foodKg &&
        e1?.moneySaved == e2?.moneySaved;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.country,
        e?.storeVerified,
        e?.store,
        e?.storeRef,
        e?.ui,
        e?.phoneNumber,
        e?.wallet,
        e?.co2,
        e?.foodKg,
        e?.moneySaved
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
