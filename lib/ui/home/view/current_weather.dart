import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model-view/weather_provider.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, WeatherProvider value, child) {
      int bosmu = value.currentIndex ?? 5000;
      return value.isLoading == true
          ? CircularProgressIndicator()
          : Container(
              width: 90.w,
              height: 23.h,
              padding: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 5,
                        offset: const Offset(0, 3),
                        color: Colors.blue.withOpacity(0.2))
                  ],
                  borderRadius: BorderRadius.circular(15.sp),
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Color(0xff4F7FFA), Color(0xff335FD1)])),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          bosmu == 5000
                              ? "Senin, 20 December 2021"
                              : value.fiveDaysPrediction
                                  .list![value.currentIndex!].dtTxt
                                  .toString()
                                  .substring(0, 16),
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.5.sp),
                        ),
                        Text(
                          "3:30 PM",
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.7.sp),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 15.w,
                          child: Image.network(bosmu == 5000
                              ? "http://openweathermap.org/img/wn/${value.currentWeatherResponse.weather![0].icon!}@2x.png"
                              : "http://openweathermap.org/img/wn/${value.fiveDaysPrediction.list![value.currentIndex!].weather![0].icon!}@2x.png"),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  bosmu == 5000
                                      ? value.currentWeatherResponse.main!.temp!
                                          .toInt()
                                          .toString()
                                      // ignore: prefer_interpolation_to_compose_strings
                                      : value
                                              .fiveDaysPrediction
                                              .list![value.currentIndex!]
                                              .main!
                                              .temp!
                                              .toInt()
                                              .toString() +
                                          " °C",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17.sp),
                                ),
                                SizedBox(
                                  width: 18.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              value.currentWeatherResponse.name.toString(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                    Text(
                      bosmu == 5000
                          ? value.currentWeatherResponse.weather![0].description
                              .toString()
                          : value.fiveDaysPrediction.list![value.currentIndex!]
                              .weather![0].main!.name
                              .toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w300),
                    ),
                    Row(
                      children: [
                        Text(
                          "Terakhir",
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.5.sp),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          "update",
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.5.sp),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          "3:00 PM",
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.5.sp),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Icon(
                          Icons.restart_alt_outlined,
                          color: Colors.white,
                          size: 17.sp,
                        )
                      ],
                    ),
                  ]),
            );
    });
  }
}
