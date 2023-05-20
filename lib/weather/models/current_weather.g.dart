// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      location: json['location'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      weathercode: $enumDecode(_$WeatherCodeEnumMap, json['weathercode']),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'location': instance.location,
      'temperature': instance.temperature,
      'weathercode': _$WeatherCodeEnumMap[instance.weathercode]!,
    };

const _$WeatherCodeEnumMap = {
  WeatherCode.clearSky: 'clearSky',
  WeatherCode.mainlyClear: 'mainlyClear',
  WeatherCode.partlyCloudy: 'partlyCloudy',
  WeatherCode.overcast: 'overcast',
  WeatherCode.fog: 'fog',
  WeatherCode.drizzle: 'drizzle',
  WeatherCode.rain: 'rain',
  WeatherCode.snow: 'snow',
  WeatherCode.thunderstorm: 'thunderstorm',
  WeatherCode.undefined: 'undefined',
};
