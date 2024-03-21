class WeatherModel {
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      countryName: json['location']['country'],
      data: DateTime.tryParse(json['current']['last_updated']),
      temp: json['current']['temp_c'],
      mixTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      img: json['current']['condition']["icon"],
    );
  }

  final String? cityName;
  final String? countryName;
  final DateTime? data;
  final String? img;
  final double? temp;
  final double? mixTemp;
  final double? minTemp;

  WeatherModel({
    required this.cityName,
    required this.countryName,
    required this.data,
    required this.temp,
    required this.mixTemp,
    required this.minTemp,
    required this.img,
  });
}
