// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      location: json['location'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      weathercode: json['weathercode'] as String,
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'location': instance.location,
      'temperature': instance.temperature,
      'weathercode': instance.weathercode,
    };
