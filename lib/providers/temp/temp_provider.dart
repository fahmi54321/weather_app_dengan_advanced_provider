import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'temp_state.dart';

class TempProvider with ChangeNotifier {
  //todo 7
  TempState _state = TempState.initial();
  TempState get state => _state;

  // todo 8 (finish)
  void toggleTempUnit() {
    _state = _state.copyWith(
      tempUnit: _state.tempUnit == TempUnit.celcius
          ? TempUnit.fahrenheit
          : TempUnit.celcius,
    );
    notifyListeners();
  }
}
