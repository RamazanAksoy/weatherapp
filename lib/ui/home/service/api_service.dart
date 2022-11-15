import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weatherapp/ui/home/model/five_days_prediction.dart';
import '../model/current_weather_response.dart';

Future<CurrentWeatherResponse?> getCurrentData(String deger) async {
  try {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$deger&appid=ae3650ad93d2f13cba73f4397b834e66&lang=tr&units=metric"));
    return CurrentWeatherResponse.fromJson(jsonDecode(response.body));
  } catch (e) {
    //  log(e.toString());
  }
  return null;
}

Future<FiveDaysPrediction?> getFiveDaysPredictionData(String deger) async {
  try {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=$deger&appid=ae3650ad93d2f13cba73f4397b834e66&lang=tr&units=metric"));
    return FiveDaysPrediction.fromJson(jsonDecode(response.body));
  } catch (e) {
    log(e.toString());
  }
  return null;
}
