// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:weather_app_dengan_advanced_provider/providers/weather/weather_provider.dart';

part 'theme_state.dart';

class ThemeProvider {
  //todo 1
  WeatherProvider weatherProvider;
  ThemeProvider({
    required this.weatherProvider,
  });

  //todo 2 (next main.dart)
  ThemeState get state {
    if (weatherProvider.state.weather.temp > 50) {
      return ThemeState(appTheme: AppTheme.light);
    } else {
      return ThemeState(appTheme: AppTheme.dark);
    }
  }
}
