import 'package:flutter_bloc_pattern_weather_app/WeatherModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    final result = await http.Client().get(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=8f4ab4cd84fbe64aa972931e794afcd3");
    if (result.statusCode != 200) {
      throw Exception();
    }

    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded['main'];

    return WeatherModel.fromJson(jsonWeather);
  }
}
