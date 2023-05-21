import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:windchimes/weather/weather.dart';


class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(context.read<WeatherRepository>()),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            switch (state.loadingState) {
              case LoadingState.initial:
                return const WeatherEmpty();
              case LoadingState.success:
                return WeatherPopulated(
                  weather: state.weather,
                  units: TemperatureUnits.celsius,
                  onRefresh: () {
                    return context.read<WeatherCubit>().getWeather();
                  },
                );
              case LoadingState.failure:
                return const WeatherFailure();
              case LoadingState.loading:
                return const WeatherLoading();
            }
          },
        )
      )
    );
  }
}