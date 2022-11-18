import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weatherapp/ui/home/model-view/weather_provider.dart';
import 'ui/home/view/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => WeatherProvider(),
      )
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Container()
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
