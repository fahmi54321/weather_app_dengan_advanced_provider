import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_dengan_advanced_provider/exceptions/weather_exception.dart';
import 'package:weather_app_dengan_advanced_provider/models/weather.dart';
import 'package:weather_app_dengan_advanced_provider/services/http_error_handler.dart';

import '../constans/constans.dart';
import '../models/direct_geocoding.dart';

class WeatherApiServices {
  final http.Client httpClient;
  WeatherApiServices({
    required this.httpClient,
  });

  //todo 1
  Future<DirectGeocoding> getDirectGeocoding(String city) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: '/geo/1.0/direct',
        queryParameters: {
          'q': city,
          'limit': kLimit,
          'appid': dotenv.env['APPID'],
        });

    try {
      final http.Response response = await httpClient.get(uri);
      if (response.statusCode != 200) {
        throw Exception(
          httpErrorHandler(response),
        );
      }

      final responseBody = json.decode(response.body);

      if (responseBody.isEmpty) {
        throw WeatherException('Cannot get the location of $city');
      }

      final directGeocoding = DirectGeocoding.fromJson(responseBody);

      return directGeocoding;
    } catch (e) {
      rethrow;
    }
  }

  //todo 2 (finish)
  Future<Weather> getWeather(DirectGeocoding directGeocoding) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: '/data/2.5/weather',
        queryParameters: {
          'lat': '${directGeocoding.lat}',
          'lon': '${directGeocoding.lon}',
          'units': kUnit,
          'appid': dotenv.env['APPID'],
        });

    try {
      final http.Response response = await httpClient.get(uri);

      print('status code : ${response.statusCode}');

      if (response.statusCode != 200) {
        throw Exception(
          httpErrorHandler(response),
        );
      }

      final weatherJson = json.decode(response.body);

      final Weather weather = Weather.fromJson(weatherJson);
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
