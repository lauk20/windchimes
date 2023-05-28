import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:windchimes/weather/weather.dart';
import 'search_view.dart';
import 'dart:developer' as developer;
import 'package:google_fonts/google_fonts.dart';


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
    developer.log('rebuilding');
    context.read<WeatherCubit>().addLocation(const Location(admin1: "test", latitude: 3.14, longitude: 3.1415, name: "tester", countryId: 12345));
    return SafeArea(
      child: Scaffold(
        //backgroundColor:Color.fromRGBO(8, 27, 37, 80),
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: Text("", style: GoogleFonts.montserrat()),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0.0,
        ),
        body: Container(
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              developer.log("blockrebuilding");
              switch (state.loadingState) {
                case LoadingState.initial:
                  return const WeatherEmpty();
                case LoadingState.success:
                  return WeatherPopulated(
                    weather: state.weather,
                    units: TemperatureUnits.celsius,
                    onRefresh: () {
                      developer.log("okay" + state.toString());
                      developer.log("anima");
                      return context.read<WeatherCubit>().getWeather(state.selectedCity);
                    },
                  );
                case LoadingState.failure:
                  return const WeatherFailure();
                case LoadingState.loading:
                  return const WeatherLoading();
              }
            },
          )
        ),
        /*
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.search),
          onPressed: () async {
            final cubit = context.read<WeatherCubit>();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: cubit,
                  child: const SearchPage(),
                )
              )
            ).then((location) async {
              cubit.setLocation(location);
              await cubit.getWeather(location);
            });
            /*
            final cityText = await Navigator.of(context).pushNamed('/search');
            if (!mounted) return;
            WeatherCubit wc = context.read<WeatherCubit>();
            final List<Location> results = await wc.getLocationResults(cityText as String);
            await wc.getWeather(results.first);
            */
          }
        ),
        */
      )
    );
  }
}