import 'package:weather_clean_arch/weather/domain/entities/weather.dart';

abstract class BaseWeatherRepository{
 Future<Weather> getWeatherByCountryName(String countryName);
 Future<String> getWeatherByLatLon({required String lat , required String lon});
}