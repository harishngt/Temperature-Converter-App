import 'package:flutter/material.dart';
import 'package:temperature_converter_app/theme/color.dart';

class TempConv extends StatefulWidget {
  const TempConv({super.key});

  @override
  State<TempConv> createState() => _TempConvState();
}

class _TempConvState extends State<TempConv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Temperature Converter",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
        backgroundColor: AppColor.primary,
        toolbarHeight: 75,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.swap_horiz_sharp),
        onPressed: () {},
        foregroundColor: AppColor.secondary,
        backgroundColor: AppColor.primary,
      ),
      body: Container(),
    );
  }
}
