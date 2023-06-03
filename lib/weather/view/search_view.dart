import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:windchimes/weather/cubit/weather_cubit.dart';
import 'package:windchimes/weather/models/models.dart';
import 'package:windchimes/weather/widgets/location_result_card.dart';
import 'package:windchimes/weather/widgets/widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchView();
  }
}

class SearchView extends StatefulWidget {
  const SearchView._();

  const SearchView({super.key});

  static Route<String> route() {
    return MaterialPageRoute(
      builder: (_) => const SearchView._()
    );
  }

  @override
  State<SearchView> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchView> {
  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;
  List<Location> results = [];

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
                          final searchResults = await cubit.getLocationResults(_text);
                          setState(() {
                            results = searchResults;
                          });
                        }
                      );
                    }
                  )
                ],
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
                          children: 
                            results.map((e) {
                              return LocationResultCard(
                                name: e.name, 
                                admin1: e.admin1, 
                                countryName: e.country,
                                location: e,
                              );
                            }).toList()
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