import 'package:flutter/material.dart';
import 'package:grocery_store/styles/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onpressed;
  final String buttonText;
  const CustomButton(
      {super.key, required this.onpressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 60,
      width: 120,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
