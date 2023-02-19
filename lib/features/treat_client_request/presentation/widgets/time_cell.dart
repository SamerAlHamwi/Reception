import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';

class TimeCell extends StatelessWidget {
  final String? value;
  final bool? islarge;

  const TimeCell({Key? key, this.value,this.islarge=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
          height:40,
          width:40,
          child: Center(child: Text(value!,style: AppTheme.headline3,)),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [BoxShadow(color: AppColors.grey,offset: Offset(0,2))]
          ),

    );
  }
}
