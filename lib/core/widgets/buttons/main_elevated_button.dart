import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimension.dart';

class MainElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? textColor;
  final Color? buttonColor;
  final bool? isSmall;
  final bool? withMargin;
  final double? height;
  final double? width;


  const MainElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.textColor,
      this.buttonColor,
       this.withMargin=true,
      this.isSmall = false,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal:16,vertical:withMargin!?8:0),
      width: isSmall!
          ? AppDimension.screenWidth(context) / 3
          : AppDimension.screenWidth(context),
      height: height ?? 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
            backgroundColor: MaterialStateProperty.all(
                buttonColor ?? AppColors.primaryColor)),
        child: Text(text,
            style: TextStyle(
                fontSize: isSmall! ? 10 : 14,
                color: textColor ?? AppColors.white,
                fontFamily: "Outfit",fontWeight: FontWeight.w700)),
      ),
    );
  }
}
