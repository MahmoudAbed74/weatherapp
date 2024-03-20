import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/Cubits/Get_Weather_Cubits/GetWeatherCubit.dart';
import 'package:weatherapp/Cubits/Get_Weather_Cubits/GetWeatherState.dart';
import 'package:weatherapp/Views/SearchView.dart';
import 'package:weatherapp/widgets/NoFindWeatherData.dart';
import 'package:weatherapp/widgets/WeatherInfoBody.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<GetWeaterCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is NoWeather_State) {
            return const NoFindWeatherData();
          } else if (state is WeatherLoading_State) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess_State) {
            return const WeatherInfoBody();
          } else {
            return const Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
