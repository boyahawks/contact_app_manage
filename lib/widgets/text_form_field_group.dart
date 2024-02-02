import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:next_contact_app/helper/constants.dart';

class TextFieldMain extends StatelessWidget {
  final Color? colorCard;
  final dynamic colorTextField;
  final double? heightCard;
  final double? fontSize;
  final double? heightTextField;
  final double? verticalPadContent;
  final double? horizontalPadContent;
  final bool? keyboardMultiline;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? readOnly;
  final String? hintText;
  final String? Function(String?)? validator;
  final BorderRadius? borderRadius;
  final Color? colorRadius;
  final Color? colorRadiusFocus;
  final Color? colorCursor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Function()? onTap;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmit;

  const TextFieldMain({
    super.key,
    this.colorCard,
    this.heightCard,
    this.prefixIcon,
    this.suffixIcon,
    this.verticalPadContent,
    this.horizontalPadContent,
    this.readOnly,
    this.hintText,
    this.keyboardMultiline,
    this.borderRadius,
    this.colorRadius,
    this.colorRadiusFocus,
    this.colorCursor,
    this.fontSize,
    this.validator,
    this.heightTextField,
    this.colorTextField,
    this.keyboardType,
    this.textInputAction,
    this.onTap,
    this.onChange,
    this.onFieldSubmit,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colorCard ?? Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8.0)),
      child: TextFormField(
        cursorColor: colorCursor ?? Colors.black,
        controller: controller,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: keyboardType ?? TextInputType.text,
        validator: validator,
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          hintText: hintText ?? "",
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: colorRadius ?? Colors.white,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: colorRadiusFocus ?? Colors.white,
              width: 2.0, // Set border width here
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2.0, // Set border width here
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2.0, // Set border width here
            ),
          ),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: Colors.black,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  color: Colors.black,
                )
              : null,
          contentPadding: EdgeInsets.symmetric(
              vertical: verticalPadContent ?? 0.0,
              horizontal: horizontalPadContent ?? 0.0),
        ),
        onTap: onTap,
        onChanged: onChange,
        onFieldSubmitted: onFieldSubmit,
        style: TextStyle(
            fontSize: fontSize ?? 16.0,
            height: heightTextField ?? 1.0,
            color: colorTextField ?? Colors.black),
      ),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  final dynamic colorCard;
  final dynamic colorTextField;
  final double? heightCard;
  final double? fontSize;
  final double? heightTextField;
  final BorderRadius? borderRadius;
  final Color? colorRadius;
  final Color? colorRadiusFocus;
  final Color? colorCursor;
  final bool? obscureController;
  final Color? obscureColorIconEnable;
  final Color? obscureColorIconDisable;
  final double? verticalPadContent;
  final double? horizontalPadContent;
  final String? Function(String?)? validator;
  final bool? statusCardCustom;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Function? onTap;
  const TextFieldPassword({
    super.key,
    this.colorCard,
    this.heightCard,
    this.borderRadius,
    this.colorRadius,
    this.colorRadiusFocus,
    this.colorCursor,
    this.verticalPadContent,
    this.horizontalPadContent,
    required this.obscureColorIconEnable,
    required this.obscureColorIconDisable,
    this.fontSize,
    this.heightTextField,
    this.colorTextField,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    required this.statusCardCustom,
    required this.obscureController,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: colorCursor ?? Colors.black,
      obscureText: !obscureController!,
      controller: controller,
      validator: validator,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: TextInputType.text,
      // inputFormatters: [
      //   FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
      // ],
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: colorRadius ?? Colors.white,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: colorRadiusFocus ?? Colors.white,
            width: 2.0, // Set border width here
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0, // Set border width here
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0, // Set border width here
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {
            if (onTap != null) onTap!();
          },
          child: Icon(
            obscureController! ? Iconsax.eye : Iconsax.eye_slash,
            size: 20,
            color: obscureController!
                ? obscureColorIconEnable
                : obscureColorIconDisable,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: verticalPadContent ?? 0.0,
            horizontal: horizontalPadContent ?? 0.0),
      ),
      style: TextStyle(
          fontSize: fontSize ?? 14.0,
          height: heightTextField ?? 1.0,
          color: colorTextField ?? Colors.black),
    );
  }
}
