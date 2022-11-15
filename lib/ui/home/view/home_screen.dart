import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weatherapp/ui/home/view/current_weather.dart';
import 'package:weatherapp/ui/home/view/five_days_prediction_weather.dart';

import '../model-view/weather_provider.dart';
import 'search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherProvider? wetProvider;

  @override
  void initState() {
    wetProvider = Provider.of<WeatherProvider>(context, listen: false);
    wetProvider!.getWeatherData(context, "Esenler");
    wetProvider!.getFiveDaysPredictionWeatherData(context, "Esenler");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.only(left: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FadeInDown(delay: const Duration(seconds: 0), child: Search()),
                FadeInUp(
                    delay: const Duration(seconds: 1),
                    child: const CurrentWeather()),
                SizedBox(
                  height: 5.w,
                ),
                ElasticIn(
                  delay: const Duration(seconds: 2),
                  child: Text(
                    "Saatlik Hava Durumu",
                    style: TextStyle(
                        fontSize: 17.5.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FadeInLeft(
                    delay: const Duration(seconds: 3),
                    child: const FiveDatsPredictionWeatherList()),
                SizedBox(
                  height: 5.h,
                ),
                ElasticIn(
                  delay: const Duration(seconds: 4),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Harian",
                        style: TextStyle(
                            fontSize: 17.5.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Column(children: [
                  FadeInRight(
                      delay: const Duration(seconds: 5),
                      child: currentWeatherDetails()),
                  FadeInUp(
                      delay: const Duration(seconds: 6),
                      child: buildOtherWeatherList()),
                ]),
              ],
            ),
          )),
        ));
  }

  SizedBox buildOtherWeatherList() {
    return SizedBox(
      width: 90.w,
      height: 50.h,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 2.h),
            width: 90.w,
            height: 10.h,
            padding: EdgeInsets.all(18.sp),
            decoration: BoxDecoration(
                color: const Color(0xffD2DFFF),
                borderRadius: BorderRadius.circular(15.sp)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 3.w),
                      width: 15.w,
                      height: 15.w,
                      child: Image.asset(
                        "assets/heavy.png",
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Selasa",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Hujan petir",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 14.5.sp),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("19 C"),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.arrow_right))
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container currentWeatherDetails() {
    return Container(
      width: 90.w,
      height: 12.h,
      padding: EdgeInsets.all(18.sp),
      decoration: BoxDecoration(
          color: const Color(0xffE7755C).withOpacity(0.13),
          borderRadius: BorderRadius.circular(15.sp)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 3.w),
            width: 15.w,
            height: 15.w,
            child: Image.asset("assets/heavy-showers-line.png"),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Cuaca esok hari kemungkinan\nakan terjadi hujan di siang hari",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.5.sp,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Jangan lupa bawa payung ya",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7), fontSize: 14.5.sp),
              )
            ],
          ),
        ],
      ),
    );
  }
}
