import 'package:flutter/material.dart';
import 'package:temperature_converter_app/screens/temperature.dart';
import 'package:temperature_converter_app/theme/color.dart';

void main() {
  runApp(MyApp()); //Run App
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TempConv(), //Call the Function which runs the app
      theme: ThemeData(
          primaryColor: AppColor.primary,
          secondaryHeaderColor: AppColor.secondary,
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ), //ThemeData: Responsible for themes in the appp
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary, width: 2)))),
    );
  }
}
