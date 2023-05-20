// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      currentWeather: CurrentWeather.fromJson(
          json['current_weather'] as Map<String, dynamic>),
      hourlyForecast: HourlyWeather.fromJson(
          json['hourly_forecast'] as Map<String, dynamic>),
      dailyForecast:
          DailyWeather.fromJson(json['daily_forecast'] as Map<String, dynamic>),
      updated: DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'current_weather': instance.currentWeather,
      'hourly_forecast': instance.hourlyForecast,
      'daily_forecast': instance.dailyForecast,
      'updated': instance.updated.toIso8601String(),
    };
