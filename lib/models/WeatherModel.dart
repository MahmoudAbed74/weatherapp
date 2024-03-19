class WeatherModel {
  WeatherModel.fromJson(Map<String, dynamic> json)
      : cityName = json['location']['name'],
        countryName = json['location']['name'],
        data = json['location']['localtime'],
        temp = json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        mixTemp = json['weather'][0]['day']['maxtemp_c'],
        minTemp = json['weather'][0]['day']['mintemp_c'],
        weatherCondition = json['weather'][0]['day']['maxtemp_c'],
        img = json['weather'][0]['day']['condition']['icon'];

  final String cityName;
  final String countryName;
  final String data;
  final String img;
  final double temp;
  final double mixTemp;
  final double minTemp;
  final double weatherCondition;

  WeatherModel(this.countryName,
      {required this.cityName,
      required this.data,
      required this.temp,
      required this.img,
      required this.mixTemp,
      required this.minTemp,
      required this.weatherCondition});
}
