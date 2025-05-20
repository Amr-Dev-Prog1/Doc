import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final bool obscureText;
  final InputBorder? enabledborder;
  final InputBorder? focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? inputStyle;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
final Color? backgroundColor;


  const LoginTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
    this.contentPadding,
    this.hintStyle,
    this.inputStyle,
    this.suffixIcon,
    this.enabledborder,
    this.focusedBorder,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType, 
    this.backgroundColor,
  });

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  void _toggleObscure() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscure,
      style: widget.inputStyle ?? TextStyles.font16DarkBlueMedium,
      validator: widget.validator,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(vertical: 20.0.w, horizontal: 18.0.h),
        suffixIcon: widget.suffixIcon ??
            (widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility_off : Icons.visibility,
                      color: ColorsManger.mainBlue,
                    ),
                    onPressed: _toggleObscure,
                  )
                : null),
        labelText: widget.labelText,
        hintText: widget.hintText,
        filled: true,
        fillColor: ColorsManger.moreLigthGray,
        hintStyle: widget.hintStyle ?? TextStyles.font14lightGrayNormal,
        labelStyle: TextStyles.font16BlueSemiBold,
        border: widget.enabledborder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: ColorsManger.lightergray),
            ),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                width: 1.3,
                color: ColorsManger.mainBlue,
              ),
            ),
      ),
    );
  }
}
