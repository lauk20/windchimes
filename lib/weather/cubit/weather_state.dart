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
  final List<Location> selectedCities;
  final Location selectedCity;

  WeatherState({
    Weather? weather,
    this.loadingState = LoadingState.initial,
    this.temperatureUnits = TemperatureUnits.celsius,
    List<Location>? selectedCities,
    Location? selectedCity,
  }) : weather = weather ?? Weather.initialWeatherState, 
       selectedCities = selectedCities ?? [],
       selectedCity = selectedCity ?? Location.initialLocationState;

  factory WeatherState.fromJson(Map<String, dynamic> json) => _$WeatherStateFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);

  WeatherState copyWith({
    Weather? weather,
    LoadingState? loadingState,
    TemperatureUnits? temperatureUnits,
    List<Location>? selectedCities,
    Location? selectedCity,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      loadingState: loadingState ?? this.loadingState,
      temperatureUnits: temperatureUnits ?? this.temperatureUnits,
      selectedCities: selectedCities ?? this.selectedCities,
      selectedCity: selectedCity ?? this.selectedCity,
    );
  }

  @override
  List<Object> get props => [weather, loadingState, temperatureUnits, selectedCities, selectedCity];
}