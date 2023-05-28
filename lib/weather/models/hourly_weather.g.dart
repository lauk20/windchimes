// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyWeather _$HourlyWeatherFromJson(Map<String, dynamic> json) =>
    HourlyWeather(
      location: json['location'] as String,
      temperatures: (json['temperatures'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      precipitationProbabilities:
          (json['precipitation_probabilities'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList(),
      weatherCodes: (json['weather_codes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      times: (json['times'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HourlyWeatherToJson(HourlyWeather instance) =>
    <String, dynamic>{
      'location': instance.location,
      'temperatures': instance.temperatures,
      'precipitation_probabilities': instance.precipitationProbabilities,
      'weather_codes': instance.weatherCodes,
      'times': instance.times,
    };
