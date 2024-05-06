// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      cityName: json['cityName'] as String?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      iconCode: json['iconCode'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'main': instance.main,
      'description': instance.description,
      'iconCode': instance.iconCode,
      'temperature': instance.temperature,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
