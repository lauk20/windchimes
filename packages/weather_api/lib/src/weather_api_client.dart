import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherAPIClient {
  final http.Client _httpClient;
  static const _weatherUrl = 'api.open-meteo.com';
  static const _geocodingUrl = 'geocoding-api.open-meteo.com';

  WeatherAPIClient(http.Client? client)
    : _httpClient = client ?? http.Client();
}