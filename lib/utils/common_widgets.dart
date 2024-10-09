import 'package:flutter/material.dart';

/// A reusable button widget with custom styling
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;
  final TextStyle? textStyle;
  final double elevation;
  final BoxDecoration? decoration;
  final double width;
  final double height;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.borderRadius = 8.0,
    this.textStyle,
    this.elevation = 2.0,
    this.decoration,
    this.width = 200,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration ??
          BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: Colors.transparent,
          // Making the button background transparent
          shadowColor: Colors.black.withOpacity(0.2),
          // Customize shadow if needed
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  CustomText({
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? TextStyle(fontSize: 16.0, color: Colors.black),
      // Default style
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLength;
  final Color? cursorColor;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final bool enabled;
  final ValueChanged<String>? onChanged;

  CustomTextFormField({
    this.controller,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.textStyle,
    this.decoration,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.maxLength,
    this.cursorColor,
    this.textAlign = TextAlign.left,
    this.textInputAction = TextInputAction.done,  // Default value is 'done'
    required this.enabled,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: decoration ??
          InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            labelText: labelText,
            labelStyle: labelStyle,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
      textAlign: textAlign,
      style: textStyle,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLength: maxLength,
      cursorColor: cursorColor,
      textInputAction: textInputAction,  // Passes the textInputAction
      enabled: enabled,
      onChanged: onChanged,
    );
  }
}

/// A reusable container with padding and a border
class CustomContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final BorderRadius borderRadius;
  final List<BoxShadow> boxShadow;
  final Widget child;
  const CustomContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    this.borderRadius = BorderRadius.zero,
    this.boxShadow = const [],
    required this.child,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
