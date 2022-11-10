import 'package:weather_app_dengan_advanced_provider/exceptions/weather_exception.dart';
import 'package:weather_app_dengan_advanced_provider/models/custom_error.dart';
import 'package:weather_app_dengan_advanced_provider/models/direct_geocoding.dart';
import 'package:weather_app_dengan_advanced_provider/models/weather.dart';
import 'package:weather_app_dengan_advanced_provider/services/weather_api_services.dart';

class WeatherRepository {
  WeatherApiServices weatherApiServices;
  WeatherRepository({
    required this.weatherApiServices,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final DirectGeocoding directGeocoding =
          await weatherApiServices.getDirectGeocoding(city);
      print('directGeocoding : $directGeocoding');

      final Weather tempWeather =
          await weatherApiServices.getWeather(directGeocoding);

      print('tempWeather :$tempWeather');

      final Weather weather = tempWeather.copyWith(
        name: directGeocoding.name,
        country: directGeocoding.country,
      );

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(
        errMsg: e.messages,
      );
    } catch (e) {
      rethrow;
    }
  }
}
