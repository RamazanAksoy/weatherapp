import 'package:flutter/material.dart';
import 'package:weatherapp/ui/home/model/five_days_prediction.dart';
import '../model/current_weather_response.dart';
import '../service/api_service.dart';

class WeatherProvider extends ChangeNotifier {
  CurrentWeatherResponse currentWeatherResponse = CurrentWeatherResponse();
  FiveDaysPrediction fiveDaysPrediction = FiveDaysPrediction();
  bool isLoading = false, isLoadingFive = false;

  getWeatherData(context, deger) async {
    isLoading = true;
    currentWeatherResponse = (await getCurrentData(deger.toString()))!;
    isLoading = false;
    notifyListeners();
  }

  getFiveDaysPredictionWeatherData(context, deger) async {
    isLoadingFive = true;
    fiveDaysPrediction = (await getFiveDaysPredictionData(deger.toString()))!;
    isLoadingFive = false;
    print(fiveDaysPrediction.list![1].dtTxt.toString());
    notifyListeners();
  }
}
