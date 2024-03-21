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
    return Colors.blue;
  }
  if (temp > 30) {
    return Colors.red;
  } else if (temp > 20) {
    return Colors.orange;
  } else if (temp > 10) {
    return Colors.yellow;
  } else if (temp > 0) {
    return Colors.green;
  } else if (temp > -10) {
    return Colors.blue;
  } else {
    return Colors.blueGrey;
  }
}
