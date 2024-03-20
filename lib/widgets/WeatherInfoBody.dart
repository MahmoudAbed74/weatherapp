import 'package:flutter/material.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            " Damanhour, Egypt",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            "updatae At 23:00",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.asset("assets/clear.png"),
            const Text(
              "data",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const Column(
              children: [Text("MaxTemp:26"), Text("MinTemp:20")],
            )
          ]),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Light Rain",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
