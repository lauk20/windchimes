import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart'show WeatherRepository, City, WeatherLocation;
import '../models/models.dart';

part 'weather_state.dart';
part 'weather_cubit.g.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository) : super(WeatherState());

  Future<void> getWeather() async {
    if (state.selectedCity.countryId == -1) return;

    emit(state.copyWith(loadingState: LoadingState.loading));

    try {
      final City city = City(
        latitude: state.selectedCity.latitude,
        longitude: state.selectedCity.longitude,
        name: state.selectedCity.name,
        countryId: state.selectedCity.countryId,
        admin1: state.selectedCity.admin1,
      );
      final WeatherLocation weatherLocation = await weatherRepository.getLocationWeather(city);
      final Weather weather = Weather.fromRepository(weatherLocation);

      emit(state.copyWith(
        weather: weather,
        loadingState: LoadingState.success,
      ));
    } on Exception {
      emit(state.copyWith(loadingState: LoadingState.failure));
    }
  }

  @override
  WeatherState fromJson(Map<String, dynamic> json) => WeatherState.fromJson(json);

  @override
  Map<String, dynamic> toJson(WeatherState state) => state.toJson();
}
