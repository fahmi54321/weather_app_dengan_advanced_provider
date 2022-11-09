part of 'weather_provider.dart';

//todo 1 create status
enum WeatherStatus {
  initial,
  loading,
  loaded,
  error,
}

class WeatherState extends Equatable {
  //todo 2
  final WeatherStatus status;
  final Weather weather;
  final CustomError customError;
  WeatherState({
    required this.status,
    required this.weather,
    required this.customError,
  });

  // todo 6 initial (next weather_provider.dart)
  factory WeatherState.initial() {
    return WeatherState(
      status: WeatherStatus.initial,
      weather: Weather.initial(),
      customError: CustomError(),
    );
  }

  // todo 3 equatable
  @override
  List<Object> get props => [status, weather, customError];

  // todo 4 toString
  @override
  bool get stringify => true;

  // todo 5 copyWith
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
