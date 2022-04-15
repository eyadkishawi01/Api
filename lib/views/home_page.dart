import 'package:app001/models/weather_model.dart';
import 'package:app001/wedgits/text.dart';
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
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/${data!.main.toString().toLowerCase()}.png"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextWidget(
                              text: data!.name.toString().toUpperCase()),
                        ),
                      ],
                    ),
                    //const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "${data!.temp?.round()}",
                          style: const TextStyle(
                              fontSize: 120,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const Text(
                          "°",
                          style: TextStyle(
                              height: -.8, color: Colors.white, fontSize: 40),
                        ),
                        const Spacer(),
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            "${data!.main}" == "Snow"
                                ? "Its Snowing"
                                : "${data!.main}" == "Clouds"
                                    ? "Cloudy skies"
                                    : "${data!.main}" == "Clear"
                                        ? "Clear skies"
                                        : "${data!.main}" == "Thunderstorm"
                                            ? "Thunderstorms"
                                            : "Rain is coming",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      data != null ? data!.temp.toString() : "Loading",
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
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
