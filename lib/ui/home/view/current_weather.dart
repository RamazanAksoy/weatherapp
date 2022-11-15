import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model-view/weather_provider.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Senin, 20 December 2021",
              style: TextStyle(color: Colors.white, fontSize: 14.5.sp),
            ),
            Text(
              "3:30 PM",
              style: TextStyle(color: Colors.white, fontSize: 14.7.sp),
            )
          ],
        ),
        Row(
          children: [
            Container(
              width: 15.w,
              child: Image.asset("assets/partly_cloudy.png"),
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
                    Consumer(
                        builder: (context, WeatherProvider value, child) =>
                            value.isLoading == true
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Text(
                                    "${value.currentWeatherResponse.main!.temp!.toInt()} °C",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17.sp),
                                  )),
                    SizedBox(
                      width: 18.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Consumer(
                    builder: (context, WeatherProvider value, child) =>
                        value.isLoading == true
                            ? const Center(child: CircularProgressIndicator())
                            : Text(
                                value.currentWeatherResponse.name.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500),
                              ))
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Terakhir",
              style: TextStyle(color: Colors.white, fontSize: 14.5.sp),
            ),
            SizedBox(
              width: 1.w,
            ),
            Text(
              "update",
              style: TextStyle(color: Colors.white, fontSize: 14.5.sp),
            ),
            SizedBox(
              width: 1.w,
            ),
            Text(
              "3:00 PM",
              style: TextStyle(color: Colors.white, fontSize: 14.5.sp),
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
  }
}
