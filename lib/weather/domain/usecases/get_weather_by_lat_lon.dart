import 'package:flutter/cupertino.dart';
import 'package:weather_clean_arch/weather/domain/repository/base_weather_repository.dart';

class GetWeatherByLatLong{
  final BaseWeatherRepository repository;
  GetWeatherByLatLong(this.repository);

  Future<String> execute({required String lat ,required String lon})async{
    return await repository.getWeatherByLatLon(lat: lat, lon: lon);
  }
}