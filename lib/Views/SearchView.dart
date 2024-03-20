import 'dart:math';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:weatherapp/Service/Weather_Serviece.dart';
import 'package:weatherapp/models/WeatherModel.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search View"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              WeatherModel weatherModel =
                  await Weather_Serviece(Dio()).getWeather(cityName: value);
              print(weatherModel.cityName);
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              hintText: "Enter City Name",
              suffixIcon: const Icon(Icons.search),
              prefixIcon: const Icon(Icons.location_on),
              labelText: "Search",
              labelStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
