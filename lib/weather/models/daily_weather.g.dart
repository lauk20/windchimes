// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeather _$DailyWeatherFromJson(Map<String, dynamic> json) => DailyWeather(
      location: json['location'] as String,
      temperaturesMax: (json['temperatures_max'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      temperaturesMin: (json['temperatures_min'] as List<dynamic>)
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

Map<String, dynamic> _$DailyWeatherToJson(DailyWeather instance) =>
    <String, dynamic>{
      'location': instance.location,
      'temperatures_max': instance.temperaturesMax,
      'temperatures_min': instance.temperaturesMin,
      'precipitation_probabilities': instance.precipitationProbabilities,
      'weather_codes': instance.weatherCodes,
      'times': instance.times,
    };
