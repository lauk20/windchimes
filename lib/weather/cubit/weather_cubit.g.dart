// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherState _$WeatherStateFromJson(Map<String, dynamic> json) => WeatherState(
      weather: json['weather'] == null
          ? null
          : Weather.fromJson(json['weather'] as Map<String, dynamic>),
      loadingState:
          $enumDecodeNullable(_$LoadingStateEnumMap, json['loadingState']) ??
              LoadingState.initial,
      temperatureUnits: $enumDecodeNullable(
              _$TemperatureUnitsEnumMap, json['temperatureUnits']) ??
          TemperatureUnits.celsius,
      selectedCities: (json['selectedCities'] as List<dynamic>?)
          ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedCity: json['selectedCity'] == null
          ? null
          : Location.fromJson(json['selectedCity'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherStateToJson(WeatherState instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'loadingState': _$LoadingStateEnumMap[instance.loadingState]!,
      'temperatureUnits': _$TemperatureUnitsEnumMap[instance.temperatureUnits]!,
      'selectedCities': instance.selectedCities,
      'selectedCity': instance.selectedCity,
    };

const _$LoadingStateEnumMap = {
  LoadingState.initial: 'initial',
  LoadingState.loading: 'loading',
  LoadingState.success: 'success',
  LoadingState.failure: 'failure',
};

const _$TemperatureUnitsEnumMap = {
  TemperatureUnits.fahrenheit: 'fahrenheit',
  TemperatureUnits.celsius: 'celsius',
};
