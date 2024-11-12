import 'package:flutter/material.dart';

class CustomElevatedBtn extends StatelessWidget {
  const CustomElevatedBtn({
    super.key,
    this.onTap,
    required this.title,
    this.style,
  });
  final Function()? onTap;
  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(),
      onPressed: onTap,
      child: Text(
        title,
        style: style,
      ),
    );
  }
}
