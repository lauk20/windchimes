import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart' as weather_repository;
import 'models.dart';

part 'weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
/// Weather ViewModel.
/// Should contain all weather infomation and forecasts for a single location
/// Refer to WeatherLocation for sample
class Weather extends Equatable {
  final CurrentWeather currentWeather;
  final HourlyWeather hourlyForecast;
  final DailyWeather dailyForecast;

  const Weather({
    required this.currentWeather,
    required this.hourlyForecast,
    required this.dailyForecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  
  factory Weather.fromRepository(weather_repository.WeatherLocation weather) {
    return Weather(
      currentWeather: CurrentWeather(
        location: weather.currentWeather.location,
        temperature: weather.currentWeather.temperature,
        weathercode: weather.currentWeather.weathercode,
      ),
      hourlyForecast: HourlyWeather(
        location: weather.hourlyForecast.location,
        temperatures: weather.hourlyForecast.temperatures,
        precipitationProbabilities: weather.hourlyForecast.precipitationProbabilities,
        weatherCodes: weather.hourlyForecast.weatherCodes,
      ),
      dailyForecast: DailyWeather(
        location: weather.dailyForecast.location,
        temperaturesMax: weather.dailyForecast.temperaturesMax,
        temperaturesMin: weather.dailyForecast.temperaturesMin,
        precipitationProbabilities: weather.dailyForecast.precipitationProbabilities,
        weatherCodes: weather.dailyForecast.weatherCodes,
      )
    );
  }

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object> get props => [currentWeather, hourlyForecast, dailyForecast];
}