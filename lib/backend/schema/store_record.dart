import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoreRecord extends FirestoreRecord {
  StoreRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "payout_method" field.
  PayoutMethodStruct? _payoutMethod;
  PayoutMethodStruct get payoutMethod => _payoutMethod ?? PayoutMethodStruct();
  bool hasPayoutMethod() => _payoutMethod != null;

  // "store_type" field.
  String? _storeType;
  String get storeType => _storeType ?? '';
  bool hasStoreType() => _storeType != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "location" field.
  LocationBagStruct? _location;
  LocationBagStruct get location => _location ?? LocationBagStruct();
  bool hasLocation() => _location != null;

  // "latLng" field.
  LatLng? _latLng;
  LatLng? get latLng => _latLng;
  bool hasLatLng() => _latLng != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "bag" field.
  BagStruct? _bag;
  BagStruct get bag => _bag ?? BagStruct();
  bool hasBag() => _bag != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "background_picture" field.
  String? _backgroundPicture;
  String get backgroundPicture => _backgroundPicture ?? '';
  bool hasBackgroundPicture() => _backgroundPicture != null;

  // "country_code" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  bool hasCountryCode() => _countryCode != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "next_bag_amounth" field.
  int? _nextBagAmounth;
  int get nextBagAmounth => _nextBagAmounth ?? 0;
  bool hasNextBagAmounth() => _nextBagAmounth != null;

  // "total_earnings" field.
  int? _totalEarnings;
  int get totalEarnings => _totalEarnings ?? 0;
  bool hasTotalEarnings() => _totalEarnings != null;

  // "fianl_payout" field.
  double? _fianlPayout;
  double get fianlPayout => _fianlPayout ?? 0.0;
  bool hasFianlPayout() => _fianlPayout != null;

  // "quarter_payout_date" field.
  String? _quarterPayoutDate;
  String get quarterPayoutDate => _quarterPayoutDate ?? '';
  bool hasQuarterPayoutDate() => _quarterPayoutDate != null;

  // "verified_store" field.
  bool? _verifiedStore;
  bool get verifiedStore => _verifiedStore ?? false;
  bool hasVerifiedStore() => _verifiedStore != null;

  // "blackList" field.
  bool? _blackList;
  bool get blackList => _blackList ?? false;
  bool hasBlackList() => _blackList != null;

  // "edit_store" field.
  bool? _editStore;
  bool get editStore => _editStore ?? false;
  bool hasEditStore() => _editStore != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _payoutMethod =
        PayoutMethodStruct.maybeFromMap(snapshotData['payout_method']);
    _storeType = snapshotData['store_type'] as String?;
    _country = snapshotData['country'] as String?;
    _location = LocationBagStruct.maybeFromMap(snapshotData['location']);
    _latLng = snapshotData['latLng'] as LatLng?;
    _user = snapshotData['user'] as DocumentReference?;
    _bag = BagStruct.maybeFromMap(snapshotData['bag']);
    _logo = snapshotData['logo'] as String?;
    _backgroundPicture = snapshotData['background_picture'] as String?;
    _countryCode = snapshotData['country_code'] as String?;
    _phone = snapshotData['phone'] as String?;
    _nextBagAmounth = castToType<int>(snapshotData['next_bag_amounth']);
    _totalEarnings = castToType<int>(snapshotData['total_earnings']);
    _fianlPayout = castToType<double>(snapshotData['fianl_payout']);
    _quarterPayoutDate = snapshotData['quarter_payout_date'] as String?;
    _verifiedStore = snapshotData['verified_store'] as bool?;
    _blackList = snapshotData['blackList'] as bool?;
    _editStore = snapshotData['edit_store'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('store');

  static Stream<StoreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoreRecord.fromSnapshot(s));

  static Future<StoreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoreRecord.fromSnapshot(s));

  static StoreRecord fromSnapshot(DocumentSnapshot snapshot) => StoreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoreRecord._(reference, mapFromFirestore(data));

  static StoreRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      StoreRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'created_time': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['created_time']),
          ),
          'payout_method': createPayoutMethodStruct(
            accountNumber:
                (snapshot.data['payout_method'] ?? {})['account_number'],
            bankName: (snapshot.data['payout_method'] ?? {})['bank_name'],
            accountNameHolder:
                (snapshot.data['payout_method'] ?? {})['account_name_holder'],
            verified: (snapshot.data['payout_method'] ?? {})['verified'],
            city: (snapshot.data['payout_method'] ?? {})['city'],
            postalcode: (snapshot.data['payout_method'] ?? {})['postalcode'],
            address: (snapshot.data['payout_method'] ?? {})['address'],
            create: true,
            clearUnsetFields: false,
          ).toMap(),
          'store_type': snapshot.data['store_type'],
          'country': snapshot.data['country'],
          'location': createLocationBagStruct(
            city: (snapshot.data['location'] ?? {})['city'],
            name: (snapshot.data['location'] ?? {})['name'],
            zipcode: (snapshot.data['location'] ?? {})['zipcode'],
            address: (snapshot.data['location'] ?? {})['address'],
            create: true,
            clearUnsetFields: false,
          ).toMap(),
          'latLng': safeGet(
            () => LatLng(
              snapshot.data['_geoloc']['lat'],
              snapshot.data['_geoloc']['lng'],
            ),
          ),
          'user': safeGet(
            () => toRef(snapshot.data['user']),
          ),
          'bag': createBagStruct(
            description: (snapshot.data['bag'] ?? {})['description'],
            active: (snapshot.data['bag'] ?? {})['active'],
            name: (snapshot.data['bag'] ?? {})['name'],
            category: (snapshot.data['bag'] ?? {})['category'],
            timeStart: safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(
                  (snapshot.data['bag'] ?? {})['time_start']),
            ),
            timeEnd: safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(
                  (snapshot.data['bag'] ?? {})['time_end']),
            ),
            amount: (snapshot.data['bag'] ?? {})['amount']?.round(),
            sold: (snapshot.data['bag'] ?? {})['sold']?.round(),
            priceInt: (snapshot.data['bag'] ?? {})['price_int']?.round(),
            co2: (snapshot.data['bag'] ?? {})['co2']?.toDouble(),
            moneySaved: (snapshot.data['bag'] ?? {})['money_saved']?.toDouble(),
            foodWeight: (snapshot.data['bag'] ?? {})['food_weight']?.toDouble(),
            create: true,
            clearUnsetFields: false,
          ).toMap(),
          'logo': snapshot.data['logo'],
          'background_picture': snapshot.data['background_picture'],
          'country_code': snapshot.data['country_code'],
          'phone': snapshot.data['phone'],
          'next_bag_amounth': snapshot.data['next_bag_amounth']?.round(),
          'total_earnings': snapshot.data['total_earnings']?.round(),
          'fianl_payout': snapshot.data['fianl_payout']?.toDouble(),
          'quarter_payout_date': snapshot.data['quarter_payout_date'],
          'verified_store': snapshot.data['verified_store'],
          'blackList': snapshot.data['blackList'],
          'edit_store': snapshot.data['edit_store'],
        },
        StoreRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<StoreRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'store',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'StoreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoreRecordData({
  String? email,
  DateTime? createdTime,
  PayoutMethodStruct? payoutMethod,
  String? storeType,
  String? country,
  LocationBagStruct? location,
  LatLng? latLng,
  DocumentReference? user,
  BagStruct? bag,
  String? logo,
  String? backgroundPicture,
  String? countryCode,
  String? phone,
  int? nextBagAmounth,
  int? totalEarnings,
  double? fianlPayout,
  String? quarterPayoutDate,
  bool? verifiedStore,
  bool? blackList,
  bool? editStore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'created_time': createdTime,
      'payout_method': PayoutMethodStruct().toMap(),
      'store_type': storeType,
      'country': country,
      'location': LocationBagStruct().toMap(),
      'latLng': latLng,
      'user': user,
      'bag': BagStruct().toMap(),
      'logo': logo,
      'background_picture': backgroundPicture,
      'country_code': countryCode,
      'phone': phone,
      'next_bag_amounth': nextBagAmounth,
      'total_earnings': totalEarnings,
      'fianl_payout': fianlPayout,
      'quarter_payout_date': quarterPayoutDate,
      'verified_store': verifiedStore,
      'blackList': blackList,
      'edit_store': editStore,
    }.withoutNulls,
  );

  // Handle nested data for "payout_method" field.
  addPayoutMethodStructData(firestoreData, payoutMethod, 'payout_method');

  // Handle nested data for "location" field.
  addLocationBagStructData(firestoreData, location, 'location');

  // Handle nested data for "bag" field.
  addBagStructData(firestoreData, bag, 'bag');

  return firestoreData;
}

class StoreRecordDocumentEquality implements Equality<StoreRecord> {
  const StoreRecordDocumentEquality();

  @override
  bool equals(StoreRecord? e1, StoreRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.createdTime == e2?.createdTime &&
        e1?.payoutMethod == e2?.payoutMethod &&
        e1?.storeType == e2?.storeType &&
        e1?.country == e2?.country &&
        e1?.location == e2?.location &&
        e1?.latLng == e2?.latLng &&
        e1?.user == e2?.user &&
        e1?.bag == e2?.bag &&
        e1?.logo == e2?.logo &&
        e1?.backgroundPicture == e2?.backgroundPicture &&
        e1?.countryCode == e2?.countryCode &&
        e1?.phone == e2?.phone &&
        e1?.nextBagAmounth == e2?.nextBagAmounth &&
        e1?.totalEarnings == e2?.totalEarnings &&
        e1?.fianlPayout == e2?.fianlPayout &&
        e1?.quarterPayoutDate == e2?.quarterPayoutDate &&
        e1?.verifiedStore == e2?.verifiedStore &&
        e1?.blackList == e2?.blackList &&
        e1?.editStore == e2?.editStore;
  }

  @override
  int hash(StoreRecord? e) => const ListEquality().hash([
        e?.email,
        e?.createdTime,
        e?.payoutMethod,
        e?.storeType,
        e?.country,
        e?.location,
        e?.latLng,
        e?.user,
        e?.bag,
        e?.logo,
        e?.backgroundPicture,
        e?.countryCode,
        e?.phone,
        e?.nextBagAmounth,
        e?.totalEarnings,
        e?.fianlPayout,
        e?.quarterPayoutDate,
        e?.verifiedStore,
        e?.blackList,
        e?.editStore
      ]);

  @override
  bool isValidKey(Object? o) => o is StoreRecord;
}
