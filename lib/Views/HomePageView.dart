import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/Cubits/Get_Weather_Cubits/GetWeatherCubit.dart';
import 'package:weatherapp/Views/SearchView.dart';
import 'package:weatherapp/widgets/NoFindWeatherData.dart';
import 'package:weatherapp/widgets/Weather_Info_Body.dart';

import '../Cubits/Get_Weather_Cubits/GetWeatherState.dart';

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
            return WeatherInfoBody(
              weatherModel: state.weatherModel,
            );
          } else if (state is WeatherFailure_State) {
            _navigateToSearchView(context);
            return Center(
              child: Text(
                "Error , ${state.messageError}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    // color: Colors.red,
                    decoration: TextDecoration.underline,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decorationStyle: TextDecorationStyle.solid),
              ),
            );
          } else {
            return const Center(
              child: Text("Unknown state"),
            );
          }
        },
      ),
    );
  }
}

void _navigateToSearchView(BuildContext context) {
  // Navigate after a delay of 2 seconds
  Future.delayed(const Duration(seconds: 4), () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return const SearchView();
      }),
    );
  });
}
