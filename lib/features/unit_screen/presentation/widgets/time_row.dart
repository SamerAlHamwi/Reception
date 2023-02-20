import 'package:flutter/material.dart';
import '../../../../features/unit_screen/presentation/widgets/time_cell.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../data/time_model.dart';


class TimeRow extends StatelessWidget {
  final TimeModel? timeModel;

  const TimeRow({Key? key, this.timeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeCell(value: timeModel!.second),
        _buildSeparator(),
        TimeCell(value: timeModel!.minutes),
        _buildSeparator(),
        TimeCell(value: timeModel!.hour),





      ],
    );
  }

  _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(":",
          style: AppTheme.headline6.copyWith(fontSize: 18,color: AppColors.primaryColor)),
    );
  }
}
