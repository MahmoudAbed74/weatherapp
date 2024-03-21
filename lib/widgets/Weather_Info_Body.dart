import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/Cubits/Get_Weather_Cubits/GetWeatherCubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/WeatherModel.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({  
    required this.weatherModel,
    super.key,
  });
 final WeatherModel weatherModel ;
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        BlocProvider.of<GetWeaterCubit>(context).weatherModel!;
    bool isHttps = weatherModel.img!.contains("https:");
    String imageUrl =
        isHttps ? weatherModel.img! : "https:${weatherModel.img!}";

    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(colors: [
          getThemeWeather(weatherModel.temp)[200]!,
          getThemeWeather(weatherModel.temp)[500]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName!,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              weatherModel.countryName!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Image.network(
                imageUrl,
                height: 100,
                fit: BoxFit.fill,
                // color: const Color.fromARGB(255, 59, 85, 255),
              ),
              Text(
                "Update Time : ${weatherModel.data!.hour} : ${weatherModel.data!.minute}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              Column(
                children: [
                  Text(
                    "MaxTemp : ${weatherModel.mixTemp!.round().toString()}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "MinTemp : ${weatherModel.minTemp!.round().toString()}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ]),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Temp: ${weatherModel.temp!.round().toString()}",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
