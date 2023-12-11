import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';

class TimeCell extends StatelessWidget {
  final String? value;
  final bool? islarge;

  const TimeCell({Key? key, this.value,this.islarge=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, sizes) {
        return Container(
          height:sizes.maxHeight,
          width:islarge!?sizes.maxHeight*1.5: sizes.maxHeight,
          child: Center(child: Text(value!,style: AppTheme.unitHeadline,)),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: AppColors.grey,offset: Offset(0,2))]
          ),
        );
      }
    );
  }
}
