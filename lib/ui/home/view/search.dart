import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../model-view/weather_provider.dart';

class Search extends StatelessWidget {
  Search({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, bottom: 2.h, right: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.place,
            color: Colors.black,
            size: 19.sp,
          ),
          SizedBox(
            width: 75.w,
            height: 5.h,
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.w))),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Bounceable(
            onTap: () {
              Provider.of<WeatherProvider>(context, listen: false)
                  .getWeatherData(context, _textEditingController.text);
              Provider.of<WeatherProvider>(context, listen: false)
                  .getFiveDaysPredictionWeatherData(
                      context, _textEditingController.text);
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 21.sp,
            ),
          )
        ],
      ),
    );
  }
}
