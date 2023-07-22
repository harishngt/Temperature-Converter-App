import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temperature_converter_app/theme/color.dart';
import 'package:temperature_converter_app/widgets/radiobutton.dart';
import 'package:temperature_converter_app/temperature_converter_logic/temperature_converter_logic.dart';

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
  String _output = '';
  TextEditingController _inputController = TextEditingController();
  TemperatureLogic _temperatureLogic = TemperatureLogic();

  void _calculate(String userInput) {
    // Get the user input from the TextField
    //String userInput = _inputController.text;

    // Convert the user input to an integer (you can handle error cases here)
    double number = double.tryParse(userInput) ?? 0;

    // Perform the calculation using predefined functions
    if (currentin == currentout) {
      _output = userInput;
    } else if (currentin == 'Celsius') {
      if (currentout == 'Kelvin') {
        double ctok = _temperatureLogic.celsiusToKelvin(number);
        _output = ctok.toStringAsFixed(2);
      } else if (currentout == 'Fahrenheit') {
        double ctof = _temperatureLogic.celsiusToFahrenheit(number);
        _output = ctof.toStringAsFixed(2);
      }
    } else if (currentin == 'Kelvin') {
      if (currentout == 'Fahrenheit') {
        double ktof = _temperatureLogic.kelvinToFahrenheit(number);
        _output = ktof.toStringAsFixed(2);
      } else if (currentout == 'Celsius') {
        double ktoc = _temperatureLogic.kelvinToCelsius(number);
        _output = ktoc.toStringAsFixed(2);
      }
    } else if (currentin == 'Fahrenheit') {
      if (currentout == 'Celsius') {
        double ftoc = _temperatureLogic.fahrenheitToCelsius(number);
        _output = ftoc.toStringAsFixed(2);
      } else if (currentout == 'Kelvin') {
        double ftok = _temperatureLogic.fahrenheitToKelvin(number);
        _output = ftok.toStringAsFixed(2);
      }
    }

    // Update the output
    setState(() {
      _output;
    });
  }

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
                  child: TextField(
                    controller: _inputController,
                    cursorColor: AppColor.primary,
                    keyboardType: TextInputType.number,
                    onChanged: _calculate,
                    style: TextStyle(fontSize: 20),
                    maxLines: 1,
                    minLines: 1,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^-?(\d+)?(\.\d*)?$')),
                    ],
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
                SizedBox(height: 5),
                Container(
                    height: 35,
                    width: 180,
                    child: Column(
                      children: [
                        Text(_output, style: TextStyle(fontSize: 20)),
                        Divider(height: 12, thickness: 1, color: Colors.black)
                      ],
                    )
                    // TextField(
                    //   keyboardType: TextInputType.number,
                    //   style: TextStyle(fontSize: 20),
                    //   maxLines: 1,
                    //   minLines: 1,
                    //   decoration: InputDecoration(
                    //     border: UnderlineInputBorder(),
                    //   ),
                    //   inputFormatters: [
                    //     FilteringTextInputFormatter.allow(
                    //         RegExp(r'^-?(\d+)?(\.\d*)?$')),
                    //   ],
                    // ),
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
