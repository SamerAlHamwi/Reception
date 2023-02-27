import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_dimension.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../select_unit_journy/data/my_ministriy_model.dart';

class LeadersCard extends StatelessWidget {
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final Employees? leaderDetails;
  final bool? isDark;
  final bool? withPadding;

  const LeadersCard(
      {Key? key,
      this.onTap,
      this.height,
      this.width,
      this.leaderDetails,
      this.isDark = false,
      this.withPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 120,
            width: AppDimension.screenWidth(context) / 4,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: isDark!
                        ? [AppColors.primaryColor, AppColors.blueColor]
                        : [Colors.cyan, Colors.blue])),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  leaderDetails!.userPosition!,
                  style: AppTheme.headline3.copyWith(
                      color: AppColors.white, overflow: TextOverflow.ellipsis),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
                Text(
                  leaderDetails!.name! + " " + leaderDetails!.surname!,
                  style: AppTheme.headline3.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      overflow: TextOverflow.ellipsis),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ],
            ))));
  }
}
