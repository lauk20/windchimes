import 'package:json_annotation/json_annotation.dart';
import 'city_data.dart';

part 'location_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationData {
  final List<CityData> results;

  const LocationData({
    required this.results,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) => _$LocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataToJson(this);
}