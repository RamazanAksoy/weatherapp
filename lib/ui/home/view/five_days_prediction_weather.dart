import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weatherapp/ui/home/model-view/weather_provider.dart';
import 'package:weatherapp/ui/home/model/five_days_prediction.dart';

class FiveDatsPredictionWeatherList extends StatelessWidget {
  const FiveDatsPredictionWeatherList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, WeatherProvider value, widget) {
      return value.isLoadingFive
          ? CircularProgressIndicator()
          : SizedBox(
              width: 100.w,
              height: 16.h,
              child: ListView.builder(
                itemCount: value.fiveDaysPrediction.list!.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 20.w,
                    padding: EdgeInsets.all(12.sp),
                    margin: EdgeInsets.only(left: 3.w, right: 3.w),
                    decoration: BoxDecoration(
                        color: const Color(0xffFBFBFB),
                        borderRadius: BorderRadius.circular(15.sp)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 16.w,
                            height: 8.h,
                            child: Image.asset("assets/partly_cloudy.png"),
                          ),
                          Text(
                            "${value.fiveDaysPrediction.list![index].main!.temp!.toInt()}º",
                            style: TextStyle(
                                fontSize: 14.5.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${value.fiveDaysPrediction.list![index].dtTxt.toString().split(" ").last.toString().substring(0, 5)}",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 14.5.sp),
                          )
                        ]),
                  );
                },
              ),
            );
    });
  }
}
