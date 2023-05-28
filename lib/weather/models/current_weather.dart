import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart';
part 'current_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
// class representing weather
class CurrentWeather extends Equatable {
  final String location;
  final double temperature;
  final String weathercode;

  const CurrentWeather({
    required this.location,
    required this.temperature,
    required this.weathercode,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);

  CurrentWeather copyWith({
    String? location,
    double? temperature,
    String? weathercode,
  }) {
    return CurrentWeather(
      location: location ?? this.location,
      temperature: temperature ?? this.temperature,
      weathercode: weathercode ?? this.weathercode,
    );
  }

  @override
  List<Object> get props => [location, temperature, weathercode];
}