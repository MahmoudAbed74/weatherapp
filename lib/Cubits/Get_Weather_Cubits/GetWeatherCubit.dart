import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/Cubits/Get_Weather_Cubits/GetWeatherState.dart';
import 'package:weatherapp/Service/Weather_Serviece.dart';
import 'package:weatherapp/models/WeatherModel.dart';

class GetWeaterCubit extends Cubit<GetWeatherState> {
  GetWeaterCubit() : super(NoWeather_State()) {
    getWeather({required String cityName}) async {
      try {
  WeatherModel weatherModel =
      await Weather_Serviece(Dio()).getWeather(cityName: cityName);
  emit(WeatherSuccess_State());
} on Exception catch (e) {
  emit(WeatherFailure_State());
}
    }
  }
}
