import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'models/models.dart';

class WeatherAPIClient {
  final http.Client _httpClient;
  static const _weatherUrl = 'api.open-meteo.com';
  static const _geocodingUrl = 'geocoding-api.open-meteo.com';

  WeatherAPIClient({http.Client? client})
    : _httpClient = client ?? http.Client();
  
  Future<LocationData> getLocation(String location) async {
    final request = Uri.https(
      _geocodingUrl,
      '/v1/search',
      {'name': location, 'count': '10'},
    );

    final response = await _httpClient.get(request);
    if (response.statusCode != 200) {
      throw Exception('Request Failed');
    }

    final json = jsonDecode(response.body) as Map;

    return LocationData.fromJson(json as Map<String, dynamic>);
  }

  Future<WeatherData> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final request = Uri.parse('https://$_weatherUrl/v1/forecast')
      .resolveUri(Uri(queryParameters: {
        'latitude': '$latitude',
        'longitude': '$longitude',
        'hourly': ['temperature_2m', 'precipitation_probability', 'weathercode'],
        'daily': ['weathercode', 'temperature_2m_max', 'temperature_2m_min', 'sunrise', 'sunset', 'precipitation_probability_max'],
        'current_weather': 'true',
        'timezone': 'UTC'
      }));
    
    final response = await _httpClient.get(request);
    if (response.statusCode != 200) {
      throw Exception('Request Failed');
    }

    final json = jsonDecode(response.body) as Map;

    return WeatherData.fromJson(json as Map<String, dynamic>);
  }
}