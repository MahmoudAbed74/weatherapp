import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapp/Cubits/Get_Weather_Cubits/GetWeatherCubit.dart';
import 'package:weatherapp/Cubits/Get_Weather_Cubits/GetWeatherState.dart';
import 'package:weatherapp/Views/HomePageView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeaterCubit(),
      child: BlocBuilder<GetWeaterCubit, GetWeatherState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: AppBarTheme(
              color: getThemeWeather(
                BlocProvider.of<GetWeaterCubit>(context).weatherModel?.temp,
              ),
            )),
            home: const HomePageView(),
          );
        },
      ),
    );
  }
}

MaterialColor getThemeWeather(double? temp) {
  if (temp == null) {
    return Colors.blue; // Default color if temperature is null
  }
  if (temp > 35) {
    return Colors.red; // Very hot
  } else if (temp > 30) {
    return Colors.orange; // Hot
  } else if (temp > 20) {
    return Colors.yellow; // Warm
  } else if (temp > 10) {
    return Colors.green; // Mild
  } else if (temp > 0) {
    return Colors.blue; // Cold
  } else {
    return Colors.blueGrey; // Very cold
  }
}
