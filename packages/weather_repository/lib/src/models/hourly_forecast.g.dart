// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyForecast _$HourlyForecastFromJson(Map<String, dynamic> json) =>
    HourlyForecast(
      location: json['location'] as String,
      temperatures: (json['temperatures'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      precipitationProbabilities:
          (json['precipitation_probabilities'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList(),
      weatherCodes: (json['weather_codes'] as List<dynamic>)
          .map((e) => $enumDecode(_$WeatherCodeEnumMap, e))
          .toList(),
      times: (json['times'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HourlyForecastToJson(HourlyForecast instance) =>
    <String, dynamic>{
      'location': instance.location,
      'temperatures': instance.temperatures,
      'precipitation_probabilities': instance.precipitationProbabilities,
      'weather_codes':
          instance.weatherCodes.map((e) => _$WeatherCodeEnumMap[e]!).toList(),
      'times': instance.times,
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
