import 'package:flutter/material.dart';
import 'package:flutter_ecom/commons/custom_text.dart';

class CustomMaterialButton extends StatelessWidget {
  final Function onPressed;
  final CustomText text;
  final Color color;
  final Color textColor;
  final double elevation;
  final Widget dropDownButtons;

  const CustomMaterialButton(
      {@required this.onPressed,
      this.text,
      this.color,
      this.textColor,
      this.elevation = 0.0,
      this.dropDownButtons});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      textColor: textColor,
      elevation: elevation,
      child: dropDownButtons ?? text,
    );
  }
}
