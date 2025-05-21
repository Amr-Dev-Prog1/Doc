import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final double? virticalPadding;
  final double? horizontalPadding;
  final double? butnWidth;
  final double? butnHeight;  
  final String butnText;
  final TextStyle? textStyle;
  final Color? backGroundColor;
  final VoidCallback onPressed;
  const AppTextButton({
    super.key,
    required this.textStyle,
    required this.onPressed,
    required this.butnText,
    this.backGroundColor,
    this.borderRadius,
    this.virticalPadding,
    this.horizontalPadding,
    this.butnWidth,
    this.butnHeight,
   });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      
      style: ButtonStyle(
        fixedSize: WidgetStateProperty .all<Size>(
          Size(butnWidth?.w ?? double.maxFinite, butnHeight?.h ?? 50.h),
        ),
        backgroundColor: WidgetStateProperty.all(
  backGroundColor ?? ColorsManger.mainBlue,
),
        shape: WidgetStateProperty .all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
          ),
        ),
        padding:  WidgetStateProperty .all<EdgeInsets>(
          EdgeInsets.symmetric(
            vertical: virticalPadding ?? 0.h,
            horizontal: horizontalPadding ?? 0.w,
          ),  
        )
      ),
      onPressed: onPressed,
      child: Text(
        butnText,
        style: textStyle ?? TextStyles.font16DarkBlueMedium
      ),
    );
  }
}