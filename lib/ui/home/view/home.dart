import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherapp/providers/weather_provider.dart';

const List<String> list = <String>[
  'Esenler',
  'Sancaktepe',
  'Esenyurt',
  'Uskudar'
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = list.first;
  WeatherProvider? wetProvider;

  @override
  void initState() {
    wetProvider = Provider.of<WeatherProvider>(context, listen: false);
    wetProvider!.getWeatherData(context,"Esenler");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              FadeInDown(
                  delay: const Duration(seconds: 0), child: appBarHome()),
              FadeInUp(
                  delay: const Duration(seconds: 1), child: buildWeather()),
              SizedBox(
                height: 5.w,
              ),
              ElasticIn(
                delay: const Duration(seconds: 2),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Cuaca Per Jam",
                      style: TextStyle(
                          fontSize: 17.5.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              FadeInLeft(
                  delay: const Duration(seconds: 3), child: buildweatherList()),
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

  SizedBox buildweatherList() {
    return SizedBox(
      width: 100.w,
      height: 15.h,
      child: ListView.builder(
        itemCount: 4,
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
                    "20º",
                    style: TextStyle(
                        fontSize: 14.5.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "4:00 PM",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 14.5.sp),
                  )
                ]),
          );
        },
      ),
    );
  }

  Container buildWeather() {
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
                                    wetProvider!
                                        .currentWeatherResponse.main!.temp
                                        .toString(),
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
                                wetProvider!.currentWeatherResponse.name
                                    .toString(),
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

  Padding appBarHome() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      child: Row(
        children: [
          Icon(
            Icons.place,
            color: Colors.black,
            size: 19.sp,
          ),
          SizedBox(
            width: 3.w,
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            elevation: 16,
            underline: Container(color: Colors.transparent),
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            
           wetProvider!.getWeatherData(context,value);

            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const Spacer(),
          Icon(
            Icons.search,
            color: Colors.black,
            size: 21.sp,
          )
        ],
      ),
    );
  }
}