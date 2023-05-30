import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:windchimes/weather/cubit/weather_cubit.dart';
import 'package:windchimes/weather/models/models.dart';
import 'package:windchimes/weather/widgets/location_result_card.dart';
import 'package:windchimes/weather/widgets/widgets.dart';
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
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //title: Text("Add Location", style: theme.textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
      ),
      body: Column(
        children: [
          Text("Add Location", style: theme.textTheme.headlineLarge),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration(
                          labelText: 'City',
                          fillColor: Colors.transparent,
                          filled: false,
                        ),
                      ),
                    ),
                    BlocBuilder<WeatherCubit, WeatherState> (
                      builder: (context, state) {
                        WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context);
                        return IconButton(
                          key: const Key('searchPage_search_iconButton'),
                          icon: const Icon(Icons.search, semanticLabel: 'Submit'),
                          onPressed: () async {
                            final locationResults = await cubit.getLocationResults(_text);
                          }
                        );
                      }
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child:
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Card(
                elevation: 0,
                color: theme.colorScheme.onPrimary,
                //color: const Color.fromRGBO(48, 48, 48, 1),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                      child: FadingListView(
                        child: ListView(
                          children: [
                            LocationResultCard(name: "London", admin1: "England", countryName: "United Kingdom"),
                            LocationResultCard(name: "London", admin1: "England", countryName: "United Kingdom"),
                            LocationResultCard(name: "London", admin1: "England", countryName: "United Kingdom"),
                            LocationResultCard(name: "London", admin1: "England", countryName: "United Kingdom"),
                            LocationResultCard(name: "London", admin1: "England", countryName: "United Kingdom"),
                            LocationResultCard(name: "London", admin1: "England", countryName: "United Kingdom"),
                            LocationResultCard(name: "London", admin1: "England", countryName: "United Kingdom"),
                            LocationResultCard(name: "London", admin1: "England", countryName: "United Kingdom"),
                            LocationResultCard(name: "London", admin1: "England", countryName: "United Kingdom"),
                            LocationResultCard(name: "London", admin1: "England", countryName: "United Kingdom"),
                          ]
                        )
                      )
                    )
                  )
                )
              )
            ),
          ),
        ],
      )
    );
  }
}

class _LocationResults extends ChangeNotifier {
  List<Location> results = [];

  void setSearchResults(List<Location> results) {
    this.results = results;
    notifyListeners();
  }
}