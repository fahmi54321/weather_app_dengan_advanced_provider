// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:weather_app_dengan_advanced_provider/models/custom_error.dart';
import 'package:weather_app_dengan_advanced_provider/models/weather.dart';
import 'package:weather_app_dengan_advanced_provider/repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherProvider with ChangeNotifier {
  WeatherState _state = WeatherState.initial();

  WeatherState get state => _state;

  final WeatherRepository weatherRepository;
  WeatherProvider({
    required this.weatherRepository,
  });

  Future<void> fetchWather(String city) async {
    _state = _state.copyWith(status: WeatherStatus.loading);
    notifyListeners();
  }
}
