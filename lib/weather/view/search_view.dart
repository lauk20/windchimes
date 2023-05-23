import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:windchimes/weather/cubit/weather_cubit.dart';
import 'package:windchimes/weather/models/models.dart';
import 'dart:developer' as developer;

class SearchPage extends StatefulWidget {
  const SearchPage._();

  const SearchPage({super.key});

  static Route<String> route() {
    return MaterialPageRoute(
      builder: (_) => const SearchPage._()
    );
  }

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('City Search')),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'NYC',
                ),
              ),
            ),
          ),
          BlocConsumer<WeatherCubit, WeatherState> (
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = context.read<WeatherCubit>();
              developer.log(cubit.state.selectedCities.toString());
              return IconButton(
                key: const Key('searchPage_search_iconButton'),
                icon: const Icon(Icons.search, semanticLabel: 'Submit'),
                onPressed: () async {
                  developer.log(cubit.state.selectedCities.toString());
                  final locationResults = await cubit.getLocationResults(_text);
                  if (!mounted) return;
                  Navigator.pop(context, locationResults.first);
                }
              );
            }
          )
        ],
      ),
    );
  }
}