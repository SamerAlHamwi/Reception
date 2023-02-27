//one_client_request_card.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/animations/fade_animation.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../select_unit_journy/data/my_ministriy_model.dart';
import '../../../unit_screen/data/clients_requests_model.dart';
import '../pages/client_book_details.dart';

class OneVisitorCardForReception extends StatelessWidget {
  final OneClientRequest? oneClientRequest;
  final MyMinistryModel? ministryModel;

  const OneVisitorCardForReception(
      {Key? key, this.oneClientRequest, this.ministryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(fadeDirection: FadeDirection.right,delay: 3,
      child: InkWell(
        onTap: () {
          oneClientRequest!.clientRequestType == 1
              ? Navigation.push(
                  context,
                  ClientBookDetails(
                    logoUrl: ministryModel!.attachment!.url,
                    oneClientRequest: oneClientRequest,
                  ))
              : null;
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 60,
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(color: AppColors.grey, offset: const Offset(0, 2))
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(oneClientRequest!.orderNumber ?? "-----",
                  style: AppTheme.bodyText1),
              Text(oneClientRequest!.unit!.name!, style: AppTheme.bodyText1),
              Text(
                  ministryModel!.ministryRequestType == 1
                      ? oneClientRequest!.clientNationalNumber ?? ""
                      : oneClientRequest!.disabilityNumber ?? "",
                  style: AppTheme.bodyText1),
              Text(
                oneClientRequest!.clientRequestType == 1
                    ? "request_processing".tr()
                    : "treated".tr(),
                style: AppTheme.bodyText1.copyWith(
                    color: oneClientRequest!.clientRequestType == 1
                        ? AppColors.lightBlueColor
                        : AppColors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
