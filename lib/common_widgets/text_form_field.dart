import 'package:flutter/material.dart';
import 'package:grocery_store/styles/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType? keyboardtype;
  final bool? isObsecure;

  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffexIcon;

  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.keyboardtype,
    this.isObsecure,
    required this.hintText,
    this.prefixIcon,
    this.suffexIcon,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: textEditingController,
        keyboardType: keyboardtype,
        obscureText: isObsecure!,
        obscuringCharacter: '*',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 12.0),
          constraints: BoxConstraints(
            maxHeight: height * 0.5,
            maxWidth: width * 0.8,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.grey,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffexIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 3.0,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.0,
              )),
        ),
      ),
    );
  }
}
