import 'package:flutter/material.dart';
import 'package:weather_clean_arch/weather/data/datasource/remote_datasource.dart';
import 'package:weather_clean_arch/weather/data/repository/weather_repository.dart';
import 'package:weather_clean_arch/weather/domain/entities/weather.dart';
import 'package:weather_clean_arch/weather/domain/repository/base_weather_repository.dart';
import 'package:weather_clean_arch/weather/domain/usecases/get_weather_by_country.dart';

void main() async{
  BaseRemoteDataSource baseRemoteDataSource = RemoteDatasource();
  BaseWeatherRepository baseWeatherRepository = WeatherRepository(baseRemoteDataSource);
  Weather weatherModel = await GetWeatherByCountryName(baseWeatherRepository).execute('Egypt');
  runApp( MyApp(
       countryName: weatherModel.cityName,
       description: weatherModel.description,
       main: weatherModel.main,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.countryName, required this.description, required this.main});
  final String countryName;
  final String description;
  final String main;
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
              Text(countryName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              Icon(Icons.sunny,color: Colors.amber,size: 100,),
              Text(description,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
              Text(main,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
      ),
    );
  }
}


