import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'weather_code.dart';

part 'weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
// class representing weather
class Weather extends Equatable {
  final String location;
  final double temperature;
  final WeatherCode weathercode;

  const Weather({
    required this.location,
    required this.temperature,
    required this.weathercode,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object> get props => [location, temperature, weathercode];
}