import 'package:weather_clean_arch/weather/data/datasource/remote_datasource.dart';
import 'package:weather_clean_arch/weather/domain/entities/weather.dart';
import 'package:weather_clean_arch/weather/domain/repository/base_weather_repository.dart';

class WeatherRepository implements BaseWeatherRepository{
  final BaseRemoteDataSource baseRemoteDatasource;
  WeatherRepository(this.baseRemoteDatasource);

  @override
  Future<Weather> getWeatherByCountryName(String countryName)async {
    return (await baseRemoteDatasource.getWeatherByCountryName(countryName))!;
  }

  @override
  Future<String> getWeatherByLatLon({required String lat, required String lon}) async{
    return await baseRemoteDatasource.getWeatherByLatLon(lat: lat, lon: lon);
  }
  
}