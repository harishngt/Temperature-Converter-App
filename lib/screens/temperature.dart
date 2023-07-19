import 'package:flutter/material.dart';
import 'package:temperature_converter_app/theme/color.dart';
import 'package:temperature_converter_app/widgets/radiobutton.dart';

class TempConv extends StatefulWidget {
  const TempConv({super.key});

  @override
  State<TempConv> createState() => _TempConvState();
}

class _TempConvState extends State<TempConv> {
  List tempunitss = [
    'Celsius',
    'Kelvin',
    'Fahrenheit',
  ];
  String temp = '';
  String currentin = 'Celsius';
  String currentout = 'Fahrenheit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Temperature Converter",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentin,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 35,
                  width: 180,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20),
                    maxLines: 1,
                    minLines: 1,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'From',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < tempunitss.length; i++)
                        CustomRadioButton(
                          unit: tempunitss[i],
                          currentlySelected: currentin,
                          onTap: (unit) {
                            currentin = unit;
                            setState(() {});
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentout,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 35,
                  width: 180,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20),
                    maxLines: 1,
                    minLines: 1,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'To',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < tempunitss.length; i++)
                        CustomRadioButton(
                          unit: tempunitss[i],
                          currentlySelected: currentout,
                          onTap: (unit) {
                            currentout = unit;
                            setState(() {});
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.swap_horiz_sharp),
        onPressed: () {
          temp = currentin;
          currentin = currentout;
          currentout = temp;
          setState(() {});
        },
        foregroundColor: AppColor.secondary,
        backgroundColor: AppColor.primary,
      ),
    );
  }
}
