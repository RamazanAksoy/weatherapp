import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Container(
            width: 100.w,
            height: 40.h,
            padding: EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: const Offset(0, 3),
                      color: Colors.blue.withOpacity(0.2))
                ],
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Color(0xff4F7FFA), Color(0xff335FD1)])),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left_outlined,
                            color: Colors.white,
                            size: 21.sp,
                          ),
                        ),
                        const Text(
                          "Tanhunasda",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                          size: 21.sp,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Senin, 20 December 2021 - ",
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
                  SizedBox(
                    width: 25.w,
                    child: Image.asset("assets/partly_cloudy.png"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "18º C",
                        style: TextStyle(color: Colors.white, fontSize: 17.sp),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        "Hujan Berawan",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              Text(
                "Cuaca Per Jam",
                style:
                    TextStyle(fontSize: 17.5.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
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
                      color: const Color.fromARGB(255, 247, 244, 244),
                      borderRadius: BorderRadius.circular(15.sp)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
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
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              Text(
                "Detail Informasi",
                style:
                    TextStyle(fontSize: 17.5.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 3.h),
            padding: EdgeInsets.symmetric(horizontal: 21.sp, vertical: 15.sp),
            width: 90.w,
            height: 12.h,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15.sp)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 15.w,
                    height: 15.w,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/image.png"))),
                    child: Text(
                      "12",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            "AQI - Sangat Baik",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 28.w,
                          ),
                        ],
                      ),
                      Text(
                        "Kualitas udara di daerahmu untuk saat ini\nsangat baik. Tidak ada pencemaran udara\nyang menyebabkan berbagai penyakit.",
                        style:
                            TextStyle(color: Colors.black, fontSize: 14.5.sp),
                      )
                    ],
                  ),
                ]),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.w),
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                width: 44.w,
                height: 7.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: Colors.grey.withOpacity(0.1)),
                child: Row(children: [
                  SizedBox(
                    width: 12.w,
                    height: 12.w,
                    child: Image.asset("assets/blaze-line.png"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            "86%",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      ),
                      Text(
                        "Kelembaban",
                        style:
                            TextStyle(color: Colors.black, fontSize: 14.5.sp),
                      ),
                    ],
                  ),
                ]),
              ),
              Container(
                width: 44.w,
                height: 7.h,
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                margin: EdgeInsets.only(right: 5.w, left: 2.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: Colors.grey.withOpacity(0.1)),
                child: Row(children: [
                  SizedBox(
                    width: 12.w,
                    height: 12.w,
                    child: Image.asset("assets/haze-2-line.png"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            "940 hPa",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                        ],
                      ),
                      Text(
                        "Tekanan Udara",
                        style:
                            TextStyle(color: Colors.black, fontSize: 14.5.sp),
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.w),
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                width: 44.w,
                height: 7.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: Colors.grey.withOpacity(0.1)),
                child: Row(children: [
                  SizedBox(
                    width: 12.w,
                    height: 12.w,
                    child: Image.asset("assets/windy-line.png"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            "1km/h",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                        ],
                      ),
                      Text(
                        "Kecepatan Angin",
                        style:
                            TextStyle(color: Colors.black, fontSize: 14.5.sp),
                      ),
                    ],
                  ),
                ]),
              ),
              Container(
                width: 44.w,
                height: 7.h,
                margin: EdgeInsets.only(right: 5.w, left: 2.w),
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: Colors.grey.withOpacity(0.1)),
                child: Row(children: [
                  SizedBox(
                    width: 12.w,
                    height: 12.w,
                    child: Image.asset("assets/mist-line.png"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            "14%",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                        ],
                      ),
                      Text(
                        "Kabut",
                        style:
                            TextStyle(color: Colors.black, fontSize: 14.5.sp),
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
