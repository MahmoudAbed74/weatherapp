import 'package:dio/dio.dart';

import 'package:weatherapp/models/WeatherModel.dart';

class Weather_Serviece {
  Weather_Serviece(this.dio);
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "3ec2be19f9d44708bee00343241903";
  Future<WeatherModel> getWeather({required String cityName}) async {
    Response response = await dio
        .get("$baseUrl/future.json?key=$apiKey&q=$cityName&dt=2024-04-19");
    try {
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String messageError = e.response?.data["error"]["message"] ??
          "oops , there was an error , try again";

      throw Exception(messageError);
    } catch (e) {
      throw Exception(" oops , there was an error , try again");
    }
  }
}
