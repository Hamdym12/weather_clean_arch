import 'package:weather_clean_arch/weather/data/datasource/remote_datasource.dart';
import 'package:weather_clean_arch/weather/domain/entities/weather.dart';
import 'package:weather_clean_arch/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository{
  final RemoteDatasource remoteDatasource;
  WeatherRepository(this.remoteDatasource);

  @override
  Future<Weather> getWeatherByCountryName(String countryName)async {
    return (await remoteDatasource.getWeatherByCountryName(countryName))!;
  }
}