part of 'weather_provider.dart';

enum WeatherStatus {
  initial,
  loading,
  loaded,
  error,
}

class WeatherState extends Equatable {
  final WeatherStatus status;
  final Weather weather;
  final CustomError customError;
  WeatherState({
    required this.status,
    required this.weather,
    required this.customError,
  });

  factory WeatherState.initial() {
    return WeatherState(
      status: WeatherStatus.initial,
      weather: Weather.initial(),
      customError: CustomError(),
    );
  }

  @override
  List<Object> get props => [status, weather, customError];

  @override
  bool get stringify => true;

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    CustomError? customError,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      customError: customError ?? this.customError,
    );
  }
}
