class WeatherModel {
  double? temp;
  double? feelsLike;
  double? min;
  double? max;
  String? name;
  String? main;

  WeatherModel({
    this.temp,
    this.feelsLike,
    this.min,
    this.max,
    this.name,
    this.main,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    temp = json["main"]["temp"];
    feelsLike = json["main"]["feels_like"];
    min = json["main"]["temp_min"];
    max = json["main"]["temp_max"];
    main = json["weather"][0]["main"];
  }
}
