import 'package:flutter_test/flutter_test.dart';
import 'package:weather_repository/weather_repository.dart';


bool nonNullTypeCheck(dynamic obj) {
  return obj != null;
}

void main() {
  test('test basic functionality', () async {
    final WeatherRepository repo = WeatherRepository();
    final List<City> ld = await repo.getLocationSearchResults("New York City");
    expect(ld, nonNullTypeCheck);

    repo.addCity(ld.first);

    final List<City> c = repo.cities;
    final WeatherLocation wl = await repo.getLocationWeather(c.first);

    // bad practice but quick and easy :)
    print(wl.currentWeather);
    print(wl.dailyForecast);
    print(wl.hourlyForecast);
  });
}
