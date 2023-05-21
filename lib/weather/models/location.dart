import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Location extends Equatable {
  final double latitude;
  final double longitude;
  final String name;
  final int countryId;
  final String admin1;

  const Location({
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.countryId,
    required this.admin1,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  static const initialLocationState = Location(
    latitude: -1,
    longitude: -1,
    name: '',
    countryId: -1,
    admin1: '',
  );

  @override
  List<Object> get props => [latitude, longitude, name, countryId, admin1];
}