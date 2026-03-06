import 'package:flutter/material.dart';
import 'package:mandi/core/constants/environment.dart';

class NewsCardBorder extends StatelessWidget {
  final double width;
  final double height;

  const NewsCardBorder({
    super.key,
    this.width = 100,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Environment.size12),
            ),
            border: Border(
              top: BorderSide(color: color, width: 3),
              left: BorderSide(color: color, width: 3),
            )),
      ),
    );
  }
}
