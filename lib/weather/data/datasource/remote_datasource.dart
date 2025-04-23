import 'package:dio/dio.dart';
import 'package:weather_clean_arch/core/helpers/constants.dart';
import 'package:weather_clean_arch/weather/data/models/weather_model.dart';

abstract class BaseRemoteDataSource{
  Future<WeatherModel?> getWeatherByCountryName(String countryName);
  Future getWeatherByLatLon({required String lat, required String lon});
}

class RemoteDatasource implements BaseRemoteDataSource{
  @override
  Future<WeatherModel?> getWeatherByCountryName(String countryName) async{
    try{
      final response = await Dio().get(
          "${AppConstants.baseURL}/weather?q=$countryName&appid=${AppConstants.appKey}"
      );
      print(response);
      return WeatherModel.fromJson(response.data);
    }catch(e){
      print(e);
      return null;
    }
  }

  @override
  Future getWeatherByLatLon({required String lat, required String lon}) async{
    // TODO: implement getWeatherByLatLon
    return 'just for testing';
  }
}