import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/ui/home/model/five_days_prediction.dart';
import 'package:weatherapp/ui/home/service/logging.dart';
import '../model/current_weather_response.dart';
import 'package:dio/dio.dart';

final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://api.openweathermap.org/data/2.5/",
    connectTimeout: 5000,
    receiveTimeout: 3000))
  ..interceptors.add(Logging());

Future<CurrentWeatherResponse?> getCurrentData(String deger) async {
  try {
    final responsedio = await _dio.get("weather", queryParameters: {
      "q": deger,
      "appid": "ae3650ad93d2f13cba73f4397b834e66",
      "lang": "tr",
      "units": "metric"
    });
/*
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$deger&appid=ae3650ad93d2f13cba73f4397b834e66&lang=tr&units=metric"));
*/

    switch (responsedio.statusCode) {
      case (200):
        {
          Get.snackbar("200", "The request succeeded.");
        }
        break;
      case (404):
        {
         Get.snackbar("404", "The HTTP 404 Not Found");

           }
        break;
           case (500):
        {
                   Get.snackbar("500","The server has encountered a situation it does not know how to handle.");

        }
        break;
           case (404):
        {
          print(
              "The HTTP 404 Not Found response status code indicates that the server cannot find the requested resource.");
        }
        break;


      default:
        {}
    }

    return CurrentWeatherResponse.fromJson(responsedio.data);
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
