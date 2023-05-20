import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart';

part 'daily_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DailyWeather extends Equatable {
  final String location;
  final List<double> temperaturesMax;
  final List<double> temperaturesMin;
  final List<double> precipitationProbabilities;
  final List<WeatherCode> weatherCodes;

  const DailyWeather({
    required this.location,
    required this.temperaturesMax,
    required this.temperaturesMin,
    required this.precipitationProbabilities,
    required this.weatherCodes,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) => _$DailyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherToJson(this);

  DailyWeather copyWith({
    String? location,
    List<double>? temperaturesMax,
    List<double>? temperaturesMin,
    List<double>? precipitationProbabilities,
    List<WeatherCode>? weatherCodes,
  }) {
    return DailyWeather(
      location: location ?? this.location, 
      temperaturesMax: temperaturesMax ?? this.temperaturesMax, 
      temperaturesMin: temperaturesMin ?? this.temperaturesMin, 
      precipitationProbabilities: precipitationProbabilities ?? this.precipitationProbabilities, 
      weatherCodes: weatherCodes ?? this.weatherCodes,
    );
  }

  @override
  List<Object> get props => [location, temperaturesMax, temperaturesMin, precipitationProbabilities, weatherCodes];
}