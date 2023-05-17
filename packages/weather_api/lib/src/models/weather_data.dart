import 'package:json_annotation/json_annotation.dart';

part 'weather_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherData {
  final Map<String, dynamic> currentWeather;
  final Map<String, dynamic> hourly;
  final Map<String, dynamic> daily;

  const WeatherData({
    required this.currentWeather,
    required this.hourly,
    required this.daily,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);


  /*
  final List<double> hourlyTemps;
  final List<double> hourlyPrecipPercentage;
  final List<int> hourlyWeatherCode;
  final List<int> dailyWeatherCode;
  final List<double> dailyTempMax;
  final List<double> dailyTempMin;
  final List<int> dailyPrecipPercentage;
  

  const WeatherData({
    required this.currentWeather,
    required this.hourlyTemps,
    required this.hourlyPrecipPercentage,
    required this.hourlyWeatherCode,
    required this.dailyPrecipPercentage,
    required this.dailyTempMax,
    required this.dailyTempMin,
    required this.dailyWeatherCode,
  });

  WeatherData.fromJson(Map<String, dynamic> json)
    : currentWeather = json['current_weather'],
      hourlyTemps = json['hourly']['temperature_2m'],
      hourlyPrecipPercentage = json['hourly']['precipitation_probability'],
      hourlyWeatherCode = json['hourly']['weathercode'],
      dailyWeatherCode = json['daily']['weathercode'],
      dailyTempMax = json['daily']['temperature_2m_max'],
      dailyTempMin = json['daily']['temperature_2m_min'],
      dailyPrecipPercentage = json['daily']['precipitation_probability_max'];
  
  Map<String, dynamic> toJson() => {
    'current_weather': currentWeather,
    'hourly': {
      'temperature_2m': hourlyTemps,
      'precipitation_probability': hourlyPrecipPercentage,
      'weathercode': hourlyWeatherCode
    },
    'daily': {
      'weathercode': dailyWeatherCode,
      'temperature_2m_max': dailyTempMax,
      'temperature_2m_min': dailyTempMin,
      'precipitation_probability_max': dailyPrecipPercentage
    }
  };
  */
}