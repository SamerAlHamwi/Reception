import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

import '../constants/app_assets.dart';
import '../constants/app_theme.dart';

class GeneralCard extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final String? trailing;
  final Color? cardColor;
  final bool? withGradient;
  final EdgeInsetsGeometry? margin;
  final Color? textColor;
  final Color? trailingColor;
  final IconData? iconData;
  final bool? withDivider;

  const GeneralCard(
      {Key? key,
      this.imageUrl,
      this.trailing = "",
      this.title = "",
      this.cardColor,
      this.withGradient = false,
      this.margin,
      this.iconData,
      this.trailingColor,
      this.textColor,
      this.withDivider = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65,
          margin: margin ?? EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.white,
              gradient: withGradient!
                  ? const LinearGradient(
                      colors: [AppColors.primaryColor, AppColors.blueColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)
                  : null,
              boxShadow: const [
                //BoxShadow(color: AppColors.lightGrey, offset: Offset(0, 5))
              ]),
          child: Center(
            child: ListTile(
              title: Text(
                title!,
                style: textColor == null
                    ? AppTheme.bodyText1
                    : AppTheme.bodyText1.copyWith(color: textColor),
              ),
              trailing: Text(trailing!,
                  style: textColor == null
                      ? AppTheme.headline6.copyWith(
                          color: trailingColor ?? AppColors.lightBlueColor)
                      : AppTheme.headline6.copyWith(color: textColor)),
              leading: iconData != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Icon(
                        iconData,
                        color: AppColors.lightBlueColor,
                      ),
                    )
                  : Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          gradient: withGradient == false
                              ? const LinearGradient(
                                  colors: [
                                      AppColors.primaryColor,
                                      AppColors.lightBlueColor
                                    ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)
                              : const LinearGradient(colors: [
                                  AppColors.white,
                                  AppColors.lightGrey
                                ])),
                      child: Image.asset(
                        imageUrl! ,
                      ),
                    ),
              minLeadingWidth: 50,
            ),
          ),
        ),
        withDivider!
            ? Padding(
                child: Divider(height: 10),
                padding: EdgeInsets.symmetric(horizontal: 24),
              )
            : Container()
      ],
    );
  }
}
