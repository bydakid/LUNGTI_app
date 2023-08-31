import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _Like = false;
  bool get Like => _Like;
  set Like(bool _value) {
    _Like = _value;
  }

  int _activebag = 1;
  int get activebag => _activebag;
  set activebag(int _value) {
    _activebag = _value;
  }

  double _nextPayout = 0.0;
  double get nextPayout => _nextPayout;
  set nextPayout(double _value) {
    _nextPayout = _value;
  }

  int _price = 0;
  int get price => _price;
  set price(int _value) {
    _price = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
