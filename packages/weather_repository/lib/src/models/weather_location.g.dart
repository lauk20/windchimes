// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherLocation _$WeatherLocationFromJson(Map<String, dynamic> json) =>
    WeatherLocation(
      currentWeather:
          Weather.fromJson(json['current_weather'] as Map<String, dynamic>),
      hourlyForecast: HourlyForecast.fromJson(
          json['hourly_forecast'] as Map<String, dynamic>),
      dailyForecast: DailyForecast.fromJson(
          json['daily_forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherLocationToJson(WeatherLocation instance) =>
    <String, dynamic>{
      'current_weather': instance.currentWeather,
      'hourly_forecast': instance.hourlyForecast,
      'daily_forecast': instance.dailyForecast,
    };
