import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'weather_code.dart';

part 'hourly_forecast.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HourlyForecast extends Equatable {
  final String location;
  final List<double> temperatures;
  final List<double> precipitationProbabilities;
  final List<WeatherCode> weatherCodes;

  const HourlyForecast({
    required this.location,
    required this.temperatures,
    required this.precipitationProbabilities,
    required this.weatherCodes,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) => _$HourlyForecastFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyForecastToJson(this);

  @override
  List<Object> get props => [location, temperatures, precipitationProbabilities, weatherCodes];
}