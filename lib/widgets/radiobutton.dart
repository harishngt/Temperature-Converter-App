import 'package:flutter/material.dart';
import 'package:temperature_converter_app/theme/color.dart';
//This file is for function to create radiobutton with user input Label for the RadioButton
class CustomRadioButton extends StatelessWidget {
  final String unit;
  final String currentlySelected;
  final Function? onTap;
  const CustomRadioButton({
    super.key,
    required this.unit,
    this.onTap,
    required this.currentlySelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(unit);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: (currentlySelected == unit)
                        ? (AppColor.primary)
                        : (Colors.transparent),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: AppColor.primary,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              unit,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
