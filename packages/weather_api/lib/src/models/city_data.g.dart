// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityData _$CityDataFromJson(Map<String, dynamic> json) => CityData(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      name: json['name'] as String,
      countryId: json['country_id'] as int,
      admin1: json['admin1'] as String,
    );

Map<String, dynamic> _$CityDataToJson(CityData instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
      'country_id': instance.countryId,
      'admin1': instance.admin1,
    };
