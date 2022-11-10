import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_dengan_advanced_provider/providers/weather/weather_provider.dart';

part 'theme_state.dart';

class ThemeProvider extends ChangeNotifier {
  //todo 7
  ThemeState _state = ThemeState.initial();
  ThemeState get state => _state;

  //todo 8 (finish)
  void update(WeatherProvider weatherProvider) {
    if (weatherProvider.state.weather.temp > 50) {
      _state = _state.copyWith(appTheme: AppTheme.light);
    } else {
      _state = _state.copyWith(appTheme: AppTheme.dark);
    }
    notifyListeners();
  }
}
