import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart';

part 'hourly_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HourlyWeather extends Equatable {
  final String location;
  final List<double> temperatures;
  final List<double> precipitationProbabilities;
  final List<WeatherCode> weatherCodes;

  const HourlyWeather({
    required this.location,
    required this.temperatures,
    required this.precipitationProbabilities,
    required this.weatherCodes,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) => _$HourlyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyWeatherToJson(this);

  HourlyWeather copyWith({
    String? location,
    List<double>? temperatures,
    List<double>? precipitationProbabilities,
    List<WeatherCode>? weatherCodes,
  }) {
    return HourlyWeather(
      location: location ?? this.location,
      temperatures: temperatures ?? this.temperatures,
      precipitationProbabilities: precipitationProbabilities ?? this.precipitationProbabilities,
      weatherCodes: weatherCodes ?? this.weatherCodes,
    );
  }

  @override
  List<Object> get props => [location, temperatures, precipitationProbabilities, weatherCodes];
}