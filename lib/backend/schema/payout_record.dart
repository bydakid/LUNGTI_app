import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PayoutRecord extends FirestoreRecord {
  PayoutRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "bag_quarter" field.
  int? _bagQuarter;
  int get bagQuarter => _bagQuarter ?? 0;
  bool hasBagQuarter() => _bagQuarter != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "bank" field.
  String? _bank;
  String get bank => _bank ?? '';
  bool hasBank() => _bank != null;

  // "bank_number" field.
  String? _bankNumber;
  String get bankNumber => _bankNumber ?? '';
  bool hasBankNumber() => _bankNumber != null;

  // "payout_quart" field.
  double? _payoutQuart;
  double get payoutQuart => _payoutQuart ?? 0.0;
  bool hasPayoutQuart() => _payoutQuart != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _bagQuarter = castToType<int>(snapshotData['bag_quarter']);
    _user = snapshotData['user'] as DocumentReference?;
    _bank = snapshotData['bank'] as String?;
    _bankNumber = snapshotData['bank_number'] as String?;
    _payoutQuart = castToType<double>(snapshotData['payout_quart']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payout');

  static Stream<PayoutRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PayoutRecord.fromSnapshot(s));

  static Future<PayoutRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PayoutRecord.fromSnapshot(s));

  static PayoutRecord fromSnapshot(DocumentSnapshot snapshot) => PayoutRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PayoutRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PayoutRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PayoutRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PayoutRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPayoutRecordData({
  DateTime? createdAt,
  int? bagQuarter,
  DocumentReference? user,
  String? bank,
  String? bankNumber,
  double? payoutQuart,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'bag_quarter': bagQuarter,
      'user': user,
      'bank': bank,
      'bank_number': bankNumber,
      'payout_quart': payoutQuart,
    }.withoutNulls,
  );

  return firestoreData;
}

class PayoutRecordDocumentEquality implements Equality<PayoutRecord> {
  const PayoutRecordDocumentEquality();

  @override
  bool equals(PayoutRecord? e1, PayoutRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.bagQuarter == e2?.bagQuarter &&
        e1?.user == e2?.user &&
        e1?.bank == e2?.bank &&
        e1?.bankNumber == e2?.bankNumber &&
        e1?.payoutQuart == e2?.payoutQuart;
  }

  @override
  int hash(PayoutRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.bagQuarter,
        e?.user,
        e?.bank,
        e?.bankNumber,
        e?.payoutQuart
      ]);

  @override
  bool isValidKey(Object? o) => o is PayoutRecord;
}
