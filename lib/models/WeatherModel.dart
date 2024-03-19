class WeatherModel {
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      countryName: json['location']['country'],
      data: json['location']['localtime'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      mixTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      img: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }

  final String cityName;
  final String countryName;
  final String data;
  final String img;
  final double temp;
  final double mixTemp;
  final double minTemp;
  final double weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.countryName,
    required this.data,
    required this.temp,
    required this.mixTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.img,
  });
}
