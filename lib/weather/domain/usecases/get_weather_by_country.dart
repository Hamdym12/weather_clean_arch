import '../entities/weather.dart';
import '../repository/base_weather_repository.dart';

class GetWeatherByCountryName{
  final BaseWeatherRepository repository;
  GetWeatherByCountryName(this.repository);

  Future<Weather> execute(String countryName)async {
    return await repository.getWeatherByCountryName(countryName);
  }
}