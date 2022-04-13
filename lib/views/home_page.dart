import 'package:app001/models/weather_model.dart';
import 'package:flutter/material.dart';

import '../serve/weather_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  WeatherModel? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("london");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Column(
                children: [
                  Text(
                    data != null ? data!.temp.toString() : "Loding",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  // Text("${data!.feelsLike}"),
                  // Text("${data!.main}"),
                  // Text("${data!.max}"),
                  // Text("${data!.min}"),
                  // Text("${data!.name}"),
                ],
              ),
            );
          } else {
            const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container();
        },
      ),
    ));
  }
}
