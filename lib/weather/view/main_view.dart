import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:windchimes/weather/cubit/weather_cubit.dart';
import 'package:windchimes/weather/models/models.dart';
import 'package:windchimes/weather/view/weather_view.dart';
import 'package:windchimes/weather/view/search_view.dart';
import 'dart:developer' as developer;

/// Flutter code sample for [NavigationBar].

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    developer.log("rebuilt navbar!!!!!!");
    return BlocProvider<WeatherCubit>.value(
      value: BlocProvider.of<WeatherCubit>(context),
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          indicatorColor: const Color.fromRGBO(255, 255, 255, 0.2),
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.sunny, color: Colors.white),
              label: 'Weather',
            ),
            NavigationDestination(
              icon: Icon(Icons.map, color: Colors.white,),
              label: 'Locations',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.bookmark_border),
              label: '-',
            ),
          ],
        ),
        body: <Widget>[
          const WeatherPage(),
          const SearchPage(),
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('Page 3'),
          ),
        ][currentPageIndex],
      )
    );
  }
}
