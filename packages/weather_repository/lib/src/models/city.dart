import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class City extends Equatable {
  final double latitude;
  final double longitude;
  final String name;
  final int countryId;
  final String admin1;

  const City({
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.countryId,
    required this.admin1,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  @override
  List<Object> get props => [latitude, longitude, name, countryId, admin1];
}