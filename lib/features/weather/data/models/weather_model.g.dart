// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      coord: json['coord'] == null
          ? null
          : CoordinateModel.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String?,
      main: json['main'] == null
          ? null
          : MainModel.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'] as int?,
      wind: json['wind'] == null
          ? null
          : WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: json['clouds'] == null
          ? null
          : CloudModel.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: json['dt'] as int?,
      sys: json['sys'] == null
          ? null
          : SysModel.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      cod: json['cod'] as int?,
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };

CoordinateModel _$CoordinateModelFromJson(Map<String, dynamic> json) =>
    CoordinateModel(
      lon: (json['lon'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinateModelToJson(CoordinateModel instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

WeatherDetailsModel _$WeatherDetailsModelFromJson(Map<String, dynamic> json) =>
    WeatherDetailsModel(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherDetailsModelToJson(
        WeatherDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

MainModel _$MainModelFromJson(Map<String, dynamic> json) => MainModel(
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feelsLike'] as num?)?.toDouble(),
      tempMin: (json['tempMin'] as num?)?.toDouble(),
      tempMax: (json['tempMax'] as num?)?.toDouble(),
      pressure: json['pressure'] as int?,
      humidity: json['humidity'] as int?,
      seaLevel: (json['seaLevel'] as num?)?.toDouble(),
      grndLevel: (json['grndLevel'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MainModelToJson(MainModel instance) => <String, dynamic>{
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'seaLevel': instance.seaLevel,
      'grndLevel': instance.grndLevel,
    };

WindModel _$WindModelFromJson(Map<String, dynamic> json) => WindModel(
      speed: (json['speed'] as num?)?.toDouble(),
      deg: (json['deg'] as num?)?.toDouble(),
      gust: (json['gust'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WindModelToJson(WindModel instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };

CloudModel _$CloudModelFromJson(Map<String, dynamic> json) => CloudModel(
      all: json['all'] as int?,
    );

Map<String, dynamic> _$CloudModelToJson(CloudModel instance) =>
    <String, dynamic>{
      'all': instance.all,
    };

SysModel _$SysModelFromJson(Map<String, dynamic> json) => SysModel(
      type: json['type'] as int?,
      id: json['id'] as int?,
      country: json['country'] as String?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
    );

Map<String, dynamic> _$SysModelToJson(SysModel instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
