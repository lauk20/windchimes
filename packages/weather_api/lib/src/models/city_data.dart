import 'package:json_annotation/json_annotation.dart';

part 'city_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CityData {
  final double latitude;
  final double longitude;
  final String name;
  final int countryId;
  final String admin1;

  const CityData({
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.countryId,
    required this.admin1
  });

  factory CityData.fromJson(Map<String, dynamic> json) => _$CityDataFromJson(json);

  Map<String, dynamic> toJson() => _$CityDataToJson(this);
}