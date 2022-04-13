import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:app001/models/weather_model.dart';

class WeatherApiClient {
  Future<WeatherModel> getCurrentWeather(String? location) async {
    var endPoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=22674e52d0f3af13953fbc693eec1d26&units=metric");

    var response = await http.get(endPoint);
    var body = jsonDecode(response.body);
    print(WeatherModel.fromJson(body));

    return WeatherModel.fromJson(body);
  }
}
