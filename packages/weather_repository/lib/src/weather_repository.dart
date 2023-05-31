import 'dart:async';
import 'package:weather_api/weather_api.dart';
import 'package:weather_repository/src/models/models.dart';
import 'dart:developer' as developer;

class WeatherRepository {
  final WeatherAPIClient _client;
  final List<City> selectedCities;

  WeatherRepository({WeatherAPIClient? client})
    : _client = client ?? WeatherAPIClient(),
      selectedCities = [];
  
  /// Get WeatherLocation object data for a specific CityData city
  Future<WeatherLocation> getLocationWeather(City city) async {
    final WeatherData weather = await _client.getWeather(latitude: city.latitude, longitude: city.longitude);
    
    DateTime currentTime = DateTime.parse(weather.currentWeather['time']);
    developer.log(currentTime.toString());
    developer.log(weather.currentWeather['time']);
    int startIndex = 0;
    for (final e in weather.hourly['time']) {
      if (DateTime.parse(e).isBefore(currentTime)) {
        startIndex = startIndex + 1;
      } else {
        break;
      }
    }
    
    final Weather currentWeather = Weather(
      location: city.name,
      temperature: weather.currentWeather['temperature'],
      weathercode: (weather.currentWeather['weathercode'] as int).toCode,
      time: currentTime,
    );
    final HourlyForecast hourlyForecast = HourlyForecast(
      location: city.name, 
      temperatures: List<double>.from(weather.hourly['temperature_2m']),
      precipitationProbabilities: List<double>.from(weather.hourly['precipitation_probability'].sublist(startIndex, startIndex + 12).map((e) => (e as int).toDouble()).toList()),
      weatherCodes: List<WeatherCode>.from(weather.hourly['weathercode'].sublist(startIndex, startIndex + 12).map((e) => (e as int).toCode).toList()),
      times: List<String>.from(weather.hourly['time'].sublist(startIndex, startIndex + 12)),
    );
    final DailyForecast dailyForecast = DailyForecast(
      location: city.name,
      temperaturesMax: List<double>.from(weather.daily['temperature_2m_max']),
      temperaturesMin: List<double>.from(weather.daily['temperature_2m_min']),
      precipitationProbabilities: List<double>.from(weather.daily['precipitation_probability_max'].map((e) => (e as int).toDouble()).toList()),
      weatherCodes: List<WeatherCode>.from(weather.daily['weathercode'].map((e) => (e as int).toCode).toList()),
      times: List<String>.from(weather.daily['time']),
    );

    return WeatherLocation(
      currentWeather: currentWeather,
      hourlyForecast: hourlyForecast,
      dailyForecast: dailyForecast,
    );
  }

  /// Get LocationData (search resuts for a city)
  Future<List<City>> getLocationSearchResults(String city) async {
    final LocationData locations = await _client.getLocation(city);

    return locations.results.map((e) => City(
      latitude: e.latitude,
      longitude: e.longitude,
      name: e.name,
      countryId: e.countryId,
      admin1: e.admin1,
      country: e.country,
    )).toList();
  }

  /// Add a city to get weather data from
  void addCity(City city) {
    selectedCities.add(city);
  }

  /// Remove a city to get weather data from based on city name
  void removeCity(String name) {
    selectedCities.removeWhere((element) => element.name == name);
  }

  /// get the selectedCities
  List<City> get cities => selectedCities;
}

/// extension to convert weather code ints to WeatherCode enum
extension on int {
  static Map<int, WeatherCode> codeMap = {
    0: WeatherCode.clearSky,
    1: WeatherCode.mainlyClear,
    2: WeatherCode.partlyCloudy,
    3: WeatherCode.overcast,
    45: WeatherCode.fog,
    48: WeatherCode.fog,
    51: WeatherCode.drizzle,
    53: WeatherCode.drizzle,
    55: WeatherCode.drizzle,
    56: WeatherCode.drizzle,
    57: WeatherCode.drizzle,
    61: WeatherCode.rain,
    63: WeatherCode.rain,
    65: WeatherCode.rain,
    66: WeatherCode.rain,
    67: WeatherCode.rain,
    71: WeatherCode.snow,
    73: WeatherCode.snow,
    75: WeatherCode.snow,
    77: WeatherCode.snow,
    80: WeatherCode.rain,
    81: WeatherCode.rain,
    82: WeatherCode.rain,
    85: WeatherCode.snow,
    86: WeatherCode.snow,
    95: WeatherCode.thunderstorm,
    96: WeatherCode.thunderstorm,
    99: WeatherCode.thunderstorm,
  };

  WeatherCode get toCode {
    return codeMap[this] ?? WeatherCode.undefined;
  }
}