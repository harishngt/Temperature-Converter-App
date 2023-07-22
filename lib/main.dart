import 'package:flutter/material.dart';
import 'package:temperature_converter_app/screens/temperature.dart';
import 'package:temperature_converter_app/theme/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TempConv(),
      theme: ThemeData(
          primaryColor: AppColor.primary,
          secondaryHeaderColor: AppColor.secondary,
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary, width: 2)))),
    );
  }
}
