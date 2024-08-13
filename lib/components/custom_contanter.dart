import 'package:flutter/cupertino.dart';

class CustomContainer extends StatelessWidget {
  final Color backgroundColor;
  final double radius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final double height;

  const CustomContainer({
    super.key,
    required this.backgroundColor,
    required this.radius,
    required this.height,
    this.topLeftRadius,
    this.bottomRightRadius,
    this.bottomLeftRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radius),
          topLeft: Radius.circular(radius),
          bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
          bottomRight: Radius.circular(bottomRightRadius ?? 0),
        ),
      ),
    );
  }
}
