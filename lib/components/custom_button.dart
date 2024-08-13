import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.bgButtonColor,
    this.buttonBorderColor,
    required this.onPress,
    this.iconButton,
    this.colorIconButton,
    this.iconSize,
    this.colorTextButton,
    this.sizeTextButton,
    this.elevation,
  });

  final String buttonText;
  final Color bgButtonColor;
  final Color? buttonBorderColor;
  final VoidCallback? onPress;
  final IconData? iconButton;
  final Color? colorIconButton;
  final double? iconSize;
  final double? sizeTextButton;
  final Color? colorTextButton;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 0.0,
      borderRadius: BorderRadius.circular(50.0),
      color: Colors.transparent,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: MediaQuery.of(context).size.height / 13,
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: buttonBorderColor ?? Colors.white),
            color: bgButtonColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: TextStyle(
                  color: colorTextButton ?? Colors.white,
                  fontSize: sizeTextButton,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (iconButton != null) SizedBox(width: 8),
              Icon(
                iconButton,
                color: colorIconButton,
                size: iconSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
