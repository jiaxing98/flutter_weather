import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final CoordinateModel? coord;
  final List<WeatherDetailsModel>? weather;
  final String? base;
  final MainModel? main;
  final int? visibility;
  final WindModel? wind;
  final CloudModel? clouds;
  final int? dt;
  final SysModel? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  WeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class CoordinateModel {
  final double? lon;
  final double? lat;

  CoordinateModel({
    required this.lon,
    required this.lat,
  });

  factory CoordinateModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinateModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateModelToJson(this);
}

@JsonSerializable()
class WeatherDetailsModel {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherDetailsModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDetailsModelToJson(this);
}

@JsonSerializable()
class MainModel {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final double? seaLevel;
  final double? grndLevel;

  MainModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainModelToJson(this);
}

@JsonSerializable()
class WindModel {
  final double? speed;
  final double? deg;
  final double? gust;

  WindModel({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);

  Map<String, dynamic> toJson() => _$WindModelToJson(this);
}

@JsonSerializable()
class CloudModel {
  final int? all;

  CloudModel({required this.all});

  factory CloudModel.fromJson(Map<String, dynamic> json) =>
      _$CloudModelFromJson(json);

  Map<String, dynamic> toJson() => _$CloudModelToJson(this);
}

@JsonSerializable()
class SysModel {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  SysModel({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) =>
      _$SysModelFromJson(json);

  Map<String, dynamic> toJson() => _$SysModelToJson(this);
}
