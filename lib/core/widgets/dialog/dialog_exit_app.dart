import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_dimension.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_theme.dart';

class DialogExitApp extends StatefulWidget {
  final String? title;
  final String? content;
  final VoidCallback? onPressedYes;
  final VoidCallback? onPressedNo;

  const DialogExitApp(
      {Key? key, this.title, this.content, this.onPressedYes, this.onPressedNo})
      : super(key: key);

  @override
  _DialogExitAppState createState() => _DialogExitAppState();
}

class _DialogExitAppState extends State<DialogExitApp> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) {
    return  AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text(
        widget.title!,
      ),
      content: Text(
        widget.content!,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width:orientation == Orientation.portrait?AppDimension.screenWidth(context)/ 5:AppDimension.screenWidth(context)/ 8,
                 height: 50,
                padding:const EdgeInsets.all(8),
                decoration:const BoxDecoration(
                    color: AppColors.lightBlueColor,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: TextButton(
                  onPressed: widget.onPressedYes,
                  child: Text('yes'.tr(),
                      style:
                          AppTheme.bodyText2.copyWith(color: AppColors.white)),
                ),
              ),
             const SizedBox(width: 8),
              Container(
                width:orientation == Orientation.portrait?AppDimension.screenWidth(context)/ 5:AppDimension.screenWidth(context)/ 8,
                height: 50,
                padding:const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.shade600,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0))),
                child: TextButton(
                  onPressed: widget.onPressedNo,
                  child: Text('no'.tr(),
                      style:
                          AppTheme.bodyText2.copyWith(color: AppColors.white)),
                ),
              ),
            ],
          ),
        ),
      ],
    );});
  }
}
