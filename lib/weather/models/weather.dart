import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart' as weather_repository;
import 'models.dart';
import 'dart:developer' as developer;

part 'weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
/// Weather ViewModel.
/// Should contain all weather infomation and forecasts for a single location
/// Refer to WeatherLocation for sample
class Weather extends Equatable {
  final CurrentWeather currentWeather;
  final HourlyWeather hourlyForecast;
  final DailyWeather dailyForecast;
  final DateTime updated;

  const Weather({
    required this.currentWeather,
    required this.hourlyForecast,
    required this.dailyForecast,
    required this.updated,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  
  factory Weather.fromRepository(weather_repository.WeatherLocation weather) {

    return Weather(
      currentWeather: CurrentWeather(
        location: weather.currentWeather.location,
        temperature: weather.currentWeather.temperature,
        weathercode: weather.currentWeather.weathercode.toName(),
      ),
      hourlyForecast: HourlyWeather(
        location: weather.hourlyForecast.location,
        temperatures: weather.hourlyForecast.temperatures,
        precipitationProbabilities: weather.hourlyForecast.precipitationProbabilities,
        weatherCodes: (weather.hourlyForecast.weatherCodes).map((e) => e.toName()).toList(),
        times: weather.hourlyForecast.times.map((e) {
          developer.log(e.toString());
          int hour = DateTime.parse(e).hour;
          if (hour < 12) {
            return '${hour.toString()} AM';
          } else if (hour == 12) {
            return '12 PM';
          } else {
            return '${(hour - 12).toString()} PM';
          }
        }).toList(),
      ),
      dailyForecast: DailyWeather(
        location: weather.dailyForecast.location,
        temperaturesMax: weather.dailyForecast.temperaturesMax,
        temperaturesMin: weather.dailyForecast.temperaturesMin,
        precipitationProbabilities: weather.dailyForecast.precipitationProbabilities,
        weatherCodes: weather.dailyForecast.weatherCodes,
        times: weather.dailyForecast.times.map((e) {
          int dayOfWeek = DateTime.parse(e).weekday;
          switch (dayOfWeek) {
            case (DateTime.monday):
              return "Monday";
            case (DateTime.tuesday):
              return "Tuesday";
            case (DateTime.wednesday):
              return "Wednesday";
            case (DateTime.thursday):
              return "Thursday";
            case (DateTime.friday):
              return "Friday";
            case (DateTime.saturday):
              return "Saturday";
            case (DateTime.sunday):
              return "Sunday";
            default:
              return "Unknown";
          }
        }).toList()
      ),
      updated: DateTime.now(),
    );
  }

  static final initialWeatherState = Weather(
    currentWeather: const CurrentWeather(
      location: '', 
      temperature: 0, 
      weathercode: 'Unknown',
    ),
    hourlyForecast: const HourlyWeather(
      location: '', 
      temperatures: [], 
      precipitationProbabilities: [], 
      weatherCodes: [],
      times: [],
    ),
    dailyForecast: const DailyWeather(
      location: '', 
      temperaturesMax: [], 
      temperaturesMin: [], 
      precipitationProbabilities: [],
      weatherCodes: [],
      times: [],
    ),
    updated: DateTime(0),
  );

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object> get props => [currentWeather, hourlyForecast, dailyForecast, updated];
}

extension on weather_repository.WeatherCode {
  String toName() {
    switch(this) {
      case (weather_repository.WeatherCode.clearSky):
        return "Sunny";
      case (weather_repository.WeatherCode.mainlyClear):
        return "Sunny";
      case (weather_repository.WeatherCode.partlyCloudy):
        return "Partly Cloudy";
      case (weather_repository.WeatherCode.overcast):
        return "Cloudy";
      case (weather_repository.WeatherCode.fog):
        return "Fog";
      case (weather_repository.WeatherCode.drizzle):
        return "Drizzle";
      case (weather_repository.WeatherCode.rain):
        return "Rain";
      case (weather_repository.WeatherCode.snow):
        return "Snow";
      case (weather_repository.WeatherCode.thunderstorm):
        return "Thunderstorm";
      default:
        return "Undefined";
    }
  }
}