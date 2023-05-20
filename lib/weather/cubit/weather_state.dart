part of 'weather_cubit.dart';

enum LoadingState {
  initial,
  loading,
  success,
  failure,
}

enum TemperatureUnits {
  fahrenheit,
  celsius,
}

@JsonSerializable()
class WeatherState extends Equatable {
  final Weather weather;
  final LoadingState loadingState;
  final TemperatureUnits temperatureUnits;

  WeatherState({
    Weather? weather,
    this.loadingState = LoadingState.initial,
    this.temperatureUnits = TemperatureUnits.celsius,
  }) : weather = weather ?? Weather.initialWeatherState;

  factory WeatherState.fromJson(Map<String, dynamic> json) => _$WeatherStateFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);

  WeatherState copyWith({
    Weather? weather,
    LoadingState? loadingState,
    TemperatureUnits? temperatureUnits,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      loadingState: loadingState ?? this.loadingState,
      temperatureUnits: temperatureUnits ?? this.temperatureUnits,
    );
  }

  @override
  List<Object> get props => [];
}