import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'temp_state.dart';

class TempProvider with ChangeNotifier {
  TempState _state = TempState.initial();
  TempState get state => _state;

  void toggleTempUnit() {
    _state = _state.copyWith(
      tempUnit: _state.tempUnit == TempUnit.celcius
          ? TempUnit.fahrenheit
          : TempUnit.celcius,
    );
    notifyListeners();
  }
}
