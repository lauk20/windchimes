import 'package:json_annotation/json_annotation.dart';

part 'location_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationData {
  final List<dynamic> results;

  const LocationData({
    required this.results,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) => _$LocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataToJson(this);
}