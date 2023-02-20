import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../features/unit_screen/presentation/widgets/time_row.dart';

import '../../../../core/constants/app_theme.dart';
import '../../data/date_model.dart';
import '../../data/time_model.dart';
import 'date_row.dart';

class DateTimeSection extends StatefulWidget {
  const DateTimeSection({Key? key}) : super(key: key);

  @override
  State<DateTimeSection> createState() => _DateTimeSectionState();
}

class _DateTimeSectionState extends State<DateTimeSection> {
  late Timer _timer;

  DateTime currentDateTime = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer =
        Timer.periodic(const Duration(milliseconds: 500), (timer) => _update());
  }

  _update() {
    setState(() {
       currentDateTime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("date".tr() + ":", style: AppTheme.headline3),
      DateRow(
        dateModel: DateModel(
            day: currentDateTime.day.toString(),
            month: currentDateTime.month.toString(),
            year: currentDateTime.year.toString()),
      ),
      SizedBox(width: 32),
      Text("time".tr() + ":", style: AppTheme.headline3),
      TimeRow(
          timeModel: TimeModel(
              hour: currentDateTime.hour.toString(),
              minutes: currentDateTime.minute.toString(),
              second: currentDateTime.second.toString()))
    ]);
  }
}
