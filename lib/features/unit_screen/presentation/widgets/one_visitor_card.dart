import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/widgets/custom_image.dart';

import '../../data/clients_requests_model.dart';

class OneVisitorCard extends StatefulWidget {
  final OneClientRequest? oneClientRequest;

  OneVisitorCard({Key? key, this.oneClientRequest}) : super(key: key);

  @override
  State<OneVisitorCard> createState() => _OneVisitorCardState();
}

class _OneVisitorCardState extends State<OneVisitorCard> {
  late Timer _timer;
  Duration? waitingTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    waitingTime =
        _convertSecondsToDuration(widget.oneClientRequest!.waitingSeconds);
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) => _update());
  }

  _update() {
    setState(() {
      waitingTime = waitingTime! + Duration(minutes: 1);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(8),
      height: 60,
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [BoxShadow(color: AppColors.grey, offset: Offset(0, 2))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomImage.rectangle(
            image: widget.oneClientRequest!.disabilityCategory!.attachment!.url,
            isNetworkImage: true,
            height: 25,
            width: 25,
          ),
          // Icon(diabledMap[oneClientRequest!.clientRequestType]),
          Text(widget.oneClientRequest!.employeetreatNumber ?? "",
              style: AppTheme.bodyText1),
          Text(
              widget.oneClientRequest!.clientNationalNumberOrDisabilityNumber ??
                  "",
              style: AppTheme.bodyText1),
          Text(
              widget.oneClientRequest!.employeetreatNumber == null
                  ? "in_waiting".tr()
                  : "treated".tr(),
              style:
                  AppTheme.bodyText1.copyWith(color: AppColors.lightBlueColor)),
          Text(
              widget.oneClientRequest!.waitingSeconds != null
                  ? waitingTime!.toString().split(":")[0]
                  +":"
                  +waitingTime!.toString().split(":")[1]
                  : "",
              style: AppTheme.bodyText1),
        ],
      ),
    );
  }

  Duration _convertSecondsToDuration(dynamic timeInSeconds) {
    int seconds = (timeInSeconds % 60).toInt();
    int minutes = ((timeInSeconds / 60) % 60).toInt();
    int hours = ((timeInSeconds / 3600) % 60).toInt();
    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }
}
