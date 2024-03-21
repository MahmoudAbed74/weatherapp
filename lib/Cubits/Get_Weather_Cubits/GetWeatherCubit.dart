import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/Cubits/Get_Weather_Cubits/GetWeatherState.dart';
import 'package:weatherapp/Service/Weather_Serviece.dart';
import 'package:weatherapp/models/WeatherModel.dart';

class GetWeaterCubit extends Cubit<GetWeatherState> {
  GetWeaterCubit() : super(NoWeather_State());

  WeatherModel? weatherModel;

  Future<void> getCurrentWeather({required String cityName}) async {
    try {
      weatherModel =
          await Weather_Serviece(Dio()).getWeather(cityName: cityName);
      emit(WeatherSuccess_State(weatherModel: weatherModel!));
    } on Exception catch (e) {
      print(e.toString());
      emit(WeatherFailure_State(messageError: e.toString()));
      
    }
  }
}
