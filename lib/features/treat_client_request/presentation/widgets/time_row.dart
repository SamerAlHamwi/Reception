import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../data/time_model.dart';
import 'time_cell.dart';

class TimeRow extends StatelessWidget {
  final TimeModel? timeModel;

  const TimeRow({Key? key, this.timeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            TimeCell(value: timeModel!.second),
            Text(
              "second".tr(),
              style:
                  AppTheme.bodyText1.copyWith(color: AppColors.lightBlueColor),
            )
          ],
        ),
        _buildSeparator(),
        Column(
          children: [
            TimeCell(value: timeModel!.minutes),
            Text(
              "minutes".tr(),
              style:
                  AppTheme.bodyText1.copyWith(color: AppColors.lightBlueColor),
            )
          ],
        ),
        _buildSeparator(),
        Column(
          children: [
            TimeCell(value: timeModel!.hour),
            Text(
              "hour".tr(),
              style:
                  AppTheme.bodyText1.copyWith(color: AppColors.lightBlueColor),
            )
          ],
        ),
      ],
    );
  }

  _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(":",
          style: AppTheme.headline6
              .copyWith(fontSize: 20, color: AppColors.primaryColor)),
    );
  }
}
