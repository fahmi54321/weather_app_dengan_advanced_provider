import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:weather_app_dengan_advanced_provider/models/custom_error.dart';
import 'package:weather_app_dengan_advanced_provider/models/weather.dart';
import 'package:weather_app_dengan_advanced_provider/repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherProvider with ChangeNotifier {
  // todo 7
  WeatherState _state = WeatherState.initial();
  WeatherState get state => _state;

  // todo 8
  final WeatherRepository weatherRepository;
  WeatherProvider({
    required this.weatherRepository,
  });

  // todo 9 method api (finish)
  Future<void> fetchWather(String city) async {
    _state = _state.copyWith(status: WeatherStatus.loading);
    notifyListeners();

    try {
      final Weather weather = await weatherRepository.fetchWeather(city);

      _state = _state.copyWith(status: WeatherStatus.loaded);

      notifyListeners();
    } on CustomError catch (e) {
      _state = _state.copyWith(
        status: WeatherStatus.error,
        customError: e,
      );
      notifyListeners();
    }
  }
}
