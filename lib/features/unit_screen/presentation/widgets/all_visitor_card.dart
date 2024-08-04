

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/animations/fade_animation.dart';
import 'package:ministries_reception_app/core/utils/shared_storage.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimension.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/frequently_used_function/frequenty_funtions.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../data/clients_requests_model.dart';

class AllVisitorCard extends StatefulWidget {
  final OneClientRequest? oneClientRequest;
  final int? ministryRequestType;
  final bool? isMainUnit;
  DateTime? creationTime;

  late Timer _timer;
  Duration? waitingTime =const Duration(seconds: 0);

  AllVisitorCard({Key? key,
    this.oneClientRequest,
    this.ministryRequestType,
    this.isMainUnit=false})
      : super(key: key);

  @override
  State<AllVisitorCard> createState() => _AllVisitorCardState();
}

class _AllVisitorCardState extends State<AllVisitorCard> {
  Duration? isLateDuration = Duration(minutes: SharedStorage.getSlaCompare());
  bool? isLate = false;

  @override
  void initState() {
    super.initState();
    widget.waitingTime = FrequentlyFunction.convertSecondsToDuration(
        widget.oneClientRequest!.waitingSeconds);
    widget._timer =
        Timer.periodic(const Duration(minutes: 1), (timer) => _update());
  }

  _update() {
    if (mounted) {
      setState(() {
        widget.waitingTime = widget.waitingTime! + const Duration(minutes: 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.creationTime = DateTime.tryParse(widget.oneClientRequest!.creationTime!)!;
    return FadeAnimation(
      delay: 2,
      fadeDirection: FadeDirection.right,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: AppColors.white, boxShadow: [
          BoxShadow(color: AppColors.grey, offset: const Offset(0, 2))
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            widget.isMainUnit!? buildFlexWidget(
              context,
              child: Text(widget.oneClientRequest!.unit!.name ?? "",
                  style: AppTheme.unitText),
            ):Container(),
            buildFlexWidget(
              context,
              child: CustomImage.rectangle(
                image: widget
                    .oneClientRequest!.disabilityCategory!.attachment!.url,
                isNetworkImage: true,
                height: 25,
                width: 25,
              ),
            ),
            buildFlexWidget(
              context,
              child: Text(widget.oneClientRequest!.orderNumber ?? "_______",
                  style: AppTheme.unitText),
            ),
            buildFlexWidget(
              context,
              child: Text(widget.oneClientRequest!.clientFullName ?? "______",
                  style: AppTheme.unitText),
            ),

            buildFlexWidget(
              context,
              child: Text(widget.oneClientRequest!.unitName ?? "______",
                  style: AppTheme.unitText),
            ),

            buildFlexWidget(
              context,
              child: Text(
                  widget.ministryRequestType == 1
                      ? widget.oneClientRequest!.clientNationalNumber ?? ""
                      : widget.oneClientRequest!.disabilityNumber ?? "",
                  style: AppTheme.unitText),
            ),

            !widget.isMainUnit!? buildFlexWidget(
              context,
              child: Text(
                  widget.oneClientRequest!.clientRequestType == 1
                      ? "in_waiting".tr()
                      : widget.oneClientRequest!.clientRequestType == 2
                      ? "treated".tr()
                      : "canceled".tr(),
                  style: AppTheme.unitText
                      .copyWith(color: AppColors.lightBlueColor)),
            ):Container(),
            buildFlexWidget(
              context,
              child: Text(
                  widget.oneClientRequest!.transactionNumber != null
                      ? widget.oneClientRequest!.transactionNumber!
                      .toInt()
                      .toString()
                      : "",
                  style: AppTheme.unitText
                      .copyWith(color: AppColors.lightBlueColor)),
            ),
            buildFlexWidget(
              context,
              child: Text(
                  widget.oneClientRequest!.waitingSeconds != null
                      ? "${widget.waitingTime!.toString().split(":")[0]}:${widget.waitingTime!.toString().split(":")[1]}"
                      : "",
                  style: AppTheme.unitText.copyWith(
                      color: (widget.oneClientRequest!.isLate! ||
                          widget.waitingTime!.inMinutes >
                              isLateDuration!.inMinutes)
                          ? Colors.red
                          : null)),
            ),
            buildFlexWidget(context,
                child: Text(
                  "${widget.creationTime!.hour}:${widget.creationTime!.minute}:${widget.creationTime!.second}",
                  style: AppTheme.unitText,
                ))
          ],
        ),
      ),
    );
  }

}

buildFlexWidget(BuildContext context, {Widget? child}) {
  return SizedBox(
      width: AppDimension.screenWidth(context) / 9.4,
      child: Align(alignment: Alignment.center, child: child!));
}
