import 'package:flutter/material.dart';
import 'package:weatherapp/models/current_weather_response.dart';
import 'package:weatherapp/services/api_service.dart';

class WeatherProvider extends ChangeNotifier {
  CurrentWeatherResponse currentWeatherResponse = CurrentWeatherResponse();
  bool isLoading = false;

  getWeatherData(context) async {
    isLoading = true;
    currentWeatherResponse = (await getCurrentData())!;
    print(currentWeatherResponse.name);
    isLoading = false;
    notifyListeners();
  }
}
