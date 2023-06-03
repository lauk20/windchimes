import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:windchimes/app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:notification_service/local_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.init();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationSupportDirectory(),
  );
  await HydratedBloc.storage.clear();

  runApp(WeatherApp(weatherRepository: WeatherRepository()));
}
