/*import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/constant.dart';
import '../../../core/widgets/custom_image.dart';

class CustomCardDetails extends StatelessWidget {
  final String? keys;
  final String? value;
  final String? image;
  final bool? isDark;
  final Color? textColor;
  final double? heightIcon;

  const CustomCardDetails({
    Key? key,
    this.keys,
    this.value,
    this.image,
    this.isDark = true,
    this.textColor,
    this.heightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
//      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDark!
                  ? [AppColors.primaryColor, AppColors.primaryColor.shade500]
                  : [
                      AppColors.lightBlueColor,
                      AppColors.lightBlueColor.shade300
                    ]),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: CustomImage.rectangle(
              image: image,
              isNetworkImage: false,
              svg: true,
              fit: BoxFit.contain,
              height: heightIcon,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...[
                  Text(keys!,
                      style: AppTheme.headline4.copyWith(color: textColor)),
                  Text(value!,
                      style: AppTheme.headline4.copyWith(color: textColor)),
                ].expand((element) => [
                      element,
                      const SizedBox(
                        height: 4,
                      )
                    ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeterministicCard extends StatelessWidget {
  final String? keys;
  final String? value;
  final String? image;
  final Color? color;
  final Color? textColor;
  final bool? isDark;
  final bool? isSvg;

  const DeterministicCard(
      {Key? key,
      this.keys,
      this.value,
      this.image,
      this.color,
      this.textColor,
      this.isDark = false,
      this.isSvg = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.48,
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.darkGrey),
          gradient: RadialGradient(radius: 5, colors: [
            color ?? AppColors.white,
            AppColors.lightGrey,
          ]),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          )),
      child: Container(
        alignment: Alignment.center,
        child: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: isDark!
                        ? [
                            AppColors.primaryColor,
                            AppColors.primaryColor.shade400
                          ]
                        : [
                            AppColors.lightBlueColor,
                            AppColors.lightBlueColor.shade400
                          ])),
//            child: Image.asset(image!),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomImage.rectangle(
                image: image!,
                isNetworkImage: false,
                svg: isSvg,
                fit: BoxFit.contain,

              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(keys!,
                  style: AppTheme.bodyText1.copyWith(
                      fontSize: 11, color: textColor ?? AppColors.primaryColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
              const SizedBox(
                height: 4,
              ),
              Text(value!,
                  style: AppTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.w900,
                      color: textColor ?? AppColors.primaryColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomProgress extends StatelessWidget {
  final bool? withButton;
  final VoidCallback? onPressed;
  final double? cardSize;
  final double? progressSize;

  const CustomProgress(
      {Key? key,
      this.withButton = true,
      this.onPressed,
      this.cardSize = 170,
      this.progressSize = 90})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardSize,
//      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15), //border corner radius
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGrey,
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...[

            Text(
              'number_of_rounds'.tr(),
              style: AppTheme.headline6.copyWith(
                  color: AppColors.grey, fontWeight: FontWeight.normal),
            ),
            Text(
              "7",
              style:
                  AppTheme.headline6.copyWith(color: AppColors.lightBlueColor),
            ),
            /* Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                      height: progressSize,
                      width: progressSize,
                      child: const CircularProgressIndicator(
                        value: 4 / 7,
                        backgroundColor: AppColors.lightGrey,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primaryColor),
                      )),
                  Positioned(
                      top: 30,
                      right: 10,
                      left: 10,
                      bottom: 25,
                      child: Column(
                        children: [
                          const Expanded(
                              child: Text("4 / 7", style: AppTheme.bodyText1)),
                         const SizedBox(
                            height: 3,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text("Round",
                                style: AppTheme.bodyText2
                                    .copyWith(color: AppColors.grey)),
                          ),
                        ],
                      )),
                ],
              ),
            ),*/
            /*withButton == true
                ? MainElevatedButton(
                    height: 30,
                    buttonColor: AppColors.lightBlueColor,
                    isSmall: true,
                    onPressed: onPressed,
                    text: 'view_rounds'.tr(),
                  )
                : */Container(),
          ].expand((element) => [
                element,
                const SizedBox(
                  height: 8,
                )
              ])
        ],
      ),
    );
  }
}*/
