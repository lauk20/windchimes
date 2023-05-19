import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'weather.dart';
import 'hourly_forecast.dart';
import 'daily_forecast.dart';

//@JsonSerializable(fieldRename: FieldRename.snake)
// Weather for specifc Location
// Should contain all the Weather objects for a certain location
class WeatherLocation extends Equatable {
  final Weather currentWeather;
  final HourlyForecast hourlyForecast;
  final DailyForecast dailyForecast;

}