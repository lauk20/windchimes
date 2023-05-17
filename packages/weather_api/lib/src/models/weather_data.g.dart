// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      currentWeather: json['current_weather'] as Map<String, dynamic>,
      hourly: json['hourly'] as Map<String, dynamic>,
      daily: json['daily'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'current_weather': instance.currentWeather,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };
