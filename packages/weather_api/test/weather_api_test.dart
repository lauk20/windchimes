import 'package:flutter_test/flutter_test.dart';
import 'package:weather_api/weather_api.dart';

bool nonNullTypeCheck(dynamic obj) {
  return obj != null;
}

void main() {
  test('Non-Null Check', () async {
    WeatherAPIClient client = WeatherAPIClient();
    final LocationData loc = await client.getLocation("New York City");
    final CityData city = loc.results[0];
    final WeatherData weather = await client.getWeather(latitude: city.latitude, longitude: city.longitude);

    expect(weather, nonNullTypeCheck);
  });
}