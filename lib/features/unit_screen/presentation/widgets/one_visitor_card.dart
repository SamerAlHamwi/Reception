import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/animations/fade_animation.dart';
import 'package:ministries_reception_app/core/utils/shared_storage.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/frequently_used_function/frequenty_funtions.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../data/clients_requests_model.dart';

class OneVisitorCard extends StatefulWidget {
  final OneClientRequest? oneClientRequest;
  late Timer _timer;
  Duration? waitingTime=Duration(seconds: 0);

  OneVisitorCard({Key? key, this.oneClientRequest}) : super(key: key);

  @override
  State<OneVisitorCard> createState() => _OneVisitorCardState();
}

class _OneVisitorCardState extends State<OneVisitorCard> {
  Duration? isLateDuration = Duration(minutes: SharedStorage.getSlaCompare());
  bool? isLate = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.waitingTime = FrequentlyFunction.convertSecondsToDuration(
        widget.oneClientRequest!.waitingSeconds);
    widget._timer =
        Timer.periodic(const Duration(minutes: 1), (timer) => _update());
  }

  _update() {
    if (mounted) {
      setState(() {
        widget.waitingTime = widget.waitingTime! + Duration(minutes: 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 2,
      fadeDirection: FadeDirection.right,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 60,
        decoration: BoxDecoration(color: AppColors.white, boxShadow: [
          BoxShadow(color: AppColors.grey, offset: Offset(0, 2))
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomImage.rectangle(
              image:
                  widget.oneClientRequest!.disabilityCategory!.attachment!.url,
              isNetworkImage: true,
              height: 25,
              width: 25,
            ),
            Text(widget.oneClientRequest!.orderNumber ?? "",
                style: AppTheme.bodyText1),
            // Icon(diabledMap[oneClientRequest!.clientRequestType]),
            Text(widget.oneClientRequest!.disabilityNumber ?? "",
                style: AppTheme.bodyText1),
            Text(widget.oneClientRequest!.clientNationalNumber ?? "",
                style: AppTheme.bodyText1),

            Text(
                widget.oneClientRequest!.clientRequestType == 1
                    ? "in_waiting".tr()
                    : widget.oneClientRequest!.clientRequestType == 2
                        ? "treated".tr()
                        : "canceled".tr(),
                style: AppTheme.bodyText1
                    .copyWith(color: AppColors.lightBlueColor)),
            Text(
                widget.oneClientRequest!.waitingSeconds != null
                    ? widget.waitingTime!.toString().split(":")[0] +
                        ":" +
                        widget.waitingTime!.toString().split(":")[1]
                    : "",
                style: AppTheme.bodyText1.copyWith(
                    color: (widget.oneClientRequest!.isLate! ||
                            widget.waitingTime!.inMinutes >
                                isLateDuration!.inMinutes)
                        ? Colors.red
                        : null)),
          ],
        ),
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
