import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart'show WeatherRepository, City, WeatherLocation;
import '../models/models.dart';
import 'dart:developer' as developer;

part 'weather_state.dart';
part 'weather_cubit.g.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository) : super(WeatherState());

  Future<void> getWeather(Location loc) async {
    developer.log('in getWeather');
    //if (state.selectedCity.countryId == -1) return;

    emit(state.copyWith(loadingState: LoadingState.loading));
    developer.log('should be loading state');
    try {
      /*
      final City city = City(
        latitude: state.selectedCity.latitude,
        longitude: state.selectedCity.longitude,
        name: state.selectedCity.name,
        countryId: state.selectedCity.countryId,
        admin1: state.selectedCity.admin1,
      );
      */
      final City city = City(
        latitude: loc.latitude,
        longitude: loc.longitude,
        name: loc.name,
        countryId: loc.countryId,
        admin1: loc.admin1,
      );
      final WeatherLocation weatherLocation = await weatherRepository.getLocationWeather(city);
      final Weather weather = Weather.fromRepository(weatherLocation);

      emit(state.copyWith(
        weather: weather,
        loadingState: LoadingState.success,
      ));
      developer.log('success');
    } on Exception {
      emit(state.copyWith(loadingState: LoadingState.failure));
    }
  }

  Future<List<Location>> getLocationResults(String location) async {
    final List<City> results = await weatherRepository.getLocationSearchResults(location);

    return results.map((e) => Location(
      latitude: e.latitude,
      longitude: e.longitude,
      name: e.name,
      countryId: e.countryId,
      admin1: e.admin1,
    )).toList();
  }

  void setLocation(Location location) {
    emit(state.copyWith(selectedCity: location));
  }

  void addLocation(Location location) {
    emit(state.copyWith(selectedCities: [...state.selectedCities, location]));
  }

  void removeLocation(String location) {
    final List<Location> cities = [...state.selectedCities];
    cities.removeWhere((element) => element.name == location);
    emit(state.copyWith(selectedCities: cities));
  }

  @override
  WeatherState fromJson(Map<String, dynamic> json) => WeatherState.fromJson(json);

  @override
  Map<String, dynamic> toJson(WeatherState state) => state.toJson();
}
