import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'weather_code.dart';

part 'daily_forecast.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DailyForecast extends Equatable {
  final String location;
  final List<double> temperaturesMax;
  final List<double> temperaturesMin;
  final List<double> precipitationProbabilities;
  final List<WeatherCode> weatherCodes;
  final List<String> times;

  const DailyForecast({
    required this.location,
    required this.temperaturesMax,
    required this.temperaturesMin,
    required this.precipitationProbabilities,
    required this.weatherCodes,
    required this.times,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) => _$DailyForecastFromJson(json);

  Map<String, dynamic> toJson() => _$DailyForecastToJson(this);

  @override
  List<Object> get props => [location, temperaturesMax, temperaturesMin, precipitationProbabilities, weatherCodes, times];
}