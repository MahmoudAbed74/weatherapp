import 'package:weatherapp/models/WeatherModel.dart';

class GetWeatherState {}


class NoWeather_State extends GetWeatherState {}

class WeatherLoading_State  extends GetWeatherState {}

class WeatherSuccess_State  extends GetWeatherState {

  final WeatherModel weatherModel;
  WeatherSuccess_State({required this.weatherModel});
}

class WeatherFailure_State  extends GetWeatherState {

  final String messageError;

  WeatherFailure_State({required this.messageError});
}
