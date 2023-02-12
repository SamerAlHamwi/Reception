import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';

import '../../data/clients_requests_model.dart';

class OneVisitorCard extends StatelessWidget {
  final OneClientRequest? oneClientRequest;

  OneVisitorCard({Key? key, this.oneClientRequest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var platformIcons;
    final Map<int, dynamic> diabledMap = {
      1: Icons.hearing_disabled,
      2: Icons.accessible,
      3: context.platformIcons.eyeSlashSolid,
    };
    return Container(
      padding: const EdgeInsets.all(8),
      height: 60,
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [BoxShadow(color: AppColors.grey, offset: Offset(0, 2))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(diabledMap[oneClientRequest!.clientRequestType]),
          Text(oneClientRequest!.employeetreatNumber!,
              style: AppTheme.bodyText1),
          Text(oneClientRequest!.clientNationalNumberOrDisabilityNumber!,
              style: AppTheme.bodyText1),
          Text("in_waiting".tr(),
              style:
                  AppTheme.bodyText1.copyWith(color: AppColors.lightBlueColor)),
          Text(
              oneClientRequest!.treatTime!
                  .split('T')[1]
                  .split(".")[0]
                  .toString(),
              style: AppTheme.bodyText1),
        ],
      ),
    );
  }
}
