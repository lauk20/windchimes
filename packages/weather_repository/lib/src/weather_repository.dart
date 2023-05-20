import 'dart:async';
import 'package:weather_api/weather_api.dart';
import 'package:weather_repository/src/models/models.dart';

class WeatherRepository {
  final WeatherAPIClient _client;
  final List<CityData> selectedCities;

  WeatherRepository(WeatherAPIClient? client)
    : _client = client ?? WeatherAPIClient(),
      selectedCities = [];
  
  /// Get WeatherLocation object data for a specific CityData city
  Future<WeatherLocation> getLocationWeather(CityData city) async {
    final WeatherData weather = await _client.getWeather(latitude: city.latitude, longitude: city.longitude);
    final Weather currentWeather = Weather(
      location: city.name,
      temperature: weather.currentWeather['temperature'],
      weathercode: weather.currentWeather['weathercode'].map((e) => int.parse(e).toCode).toList(),
    );
    final HourlyForecast hourlyForecast = HourlyForecast(
      location: city.name, 
      temperatures: weather.hourly['temperature_2m'], 
      precipitationProbabilities: weather.hourly['precipitation_probabiliy'], 
      weatherCodes: weather.hourly['weathercode'].map((e) => int.parse(e).toCode).toList(),
    );
    final DailyForecast dailyForecast = DailyForecast(
      location: city.name,
      temperaturesMax: weather.daily['temperature_2m_max'], 
      temperaturesMin: weather.daily['temperature_2m_min'], 
      precipitationProbabilities: weather.daily['precipitation_probability_max'], 
      weatherCodes: weather.daily['weathercode'].map((e) => int.parse(e).toCode).toList(),
    );

    return WeatherLocation(
      currentWeather: currentWeather,
      hourlyForecast: hourlyForecast,
      dailyForecast: dailyForecast,
    );
  }

  /// Get LocationData (search resuts for a city)
  Future<LocationData> getLocationSearchResults(String city) async {
    final LocationData results = await _client.getLocation(city);

    return results;
  }

  /// Add a city to get weather data from
  void addCity(CityData city) {
    selectedCities.add(city);
  }

  /// Remove a city to get weather data from based on city name
  void removeCity(String name) {
    selectedCities.removeWhere((element) => element.name == name);
  }

  /// get the selectedCities
  List<CityData> get cities => selectedCities;
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