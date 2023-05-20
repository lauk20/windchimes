import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'current_weather.dart';
import 'hourly_forecast.dart';
import 'daily_forecast.dart';

part 'weather_location.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
// Weather for specifc Location
// Should contain all the Weather objects for a certain location
class WeatherLocation extends Equatable {
  final Weather currentWeather;
  final HourlyForecast hourlyForecast;
  final DailyForecast dailyForecast;

  const WeatherLocation({
    required this.currentWeather,
    required this.hourlyForecast,
    required this.dailyForecast,
  });

  factory WeatherLocation.fromJson(Map<String, dynamic> json) => _$WeatherLocationFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherLocationToJson(this);

  @override
  List<Object> get props => [currentWeather, hourlyForecast, dailyForecast];
}