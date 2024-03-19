import 'package:flutter/material.dart';

import 'package:weatherapp/Views/SearchView.dart';
import 'package:weatherapp/widgets/Weather_Info_Body.dart';

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
      body: const Weather_Info_Body(),
    );
  }
}
