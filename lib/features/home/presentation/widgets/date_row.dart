import 'package:flutter/material.dart';
import '../../../../features/home/presentation/widgets/time_cell.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../data/date_model.dart';
import '../../data/time_model.dart';


class DateRow extends StatelessWidget {
  final DateModel? dateModel;

  const DateRow({Key? key, this.dateModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeCell(value: dateModel!.day),
        SizedBox(width: 8),
        TimeCell(value: dateModel!.month),
        SizedBox(width: 8),
        TimeCell(value: dateModel!.year),

      ],
    );
  }


}
