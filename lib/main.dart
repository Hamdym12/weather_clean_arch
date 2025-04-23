import 'package:flutter/material.dart';
import 'package:weather_clean_arch/weather/data/datasource/remote_datasource.dart';
import 'package:weather_clean_arch/weather/data/repository/weather_repository.dart';
import 'package:weather_clean_arch/weather/domain/entities/weather.dart';
import 'package:weather_clean_arch/weather/domain/repository/base_weather_repository.dart';
import 'package:weather_clean_arch/weather/domain/usecases/get_weather_by_country.dart';
import 'package:weather_clean_arch/weather/domain/usecases/get_weather_by_lat_lon.dart';

void main() async{
  BaseRemoteDataSource baseRemoteDataSource = RemoteDatasource();
  BaseWeatherRepository baseWeatherRepository = WeatherRepository(baseRemoteDataSource);
  Weather weather = await GetWeatherByCountryName(baseWeatherRepository).execute('Egypt');
  var test = await GetWeatherByLatLong(baseWeatherRepository).execute(lat: 'lat', lon: 'lon');
  print(test);
  runApp( MyApp(
       weather: weather,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.weather});
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Text(weather.cityName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              Text(weather.description,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
              Text(weather.main,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
      ),
    );
  }
}