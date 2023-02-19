import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';
import 'package:ministries_reception_app/core/widgets/default_scaffold.dart';

import '../../../../core/utils/navigation.dart';
import '../../../booking_information/presentation/pages/waiting_list_page.dart';
import '../../../select_department_journy/data/my_ministriy_model.dart';
import '../../../select_department_journy/presentation/widgets/main_elevated_button.dart';
import '../../data/create_client_response_model.dart';
import '../widgets/key_value_row.dart';

class ConfirmBookingPage extends StatelessWidget {
  final MyMinistryModel? ministryModel;
  final MyMinistryModel? myMinistryModel;
  final String? selectedUnitName;
  final CreateClientResponseModel? createClientResponseModel;

  const ConfirmBookingPage(
      {Key? key,
      this.selectedUnitName,
      this.myMinistryModel,
      this.ministryModel,
      this.createClientResponseModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        logoUrl: myMinistryModel!.attachment!.url,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...[
                const Icon(
                  Icons.security_outlined,
                  color: AppColors.lightBlueColor,
                  size: 60,
                ),
                Text(
                  "booking_is_finished".tr(),
                  style: AppTheme.headline3.copyWith(
                      color: AppColors.black.withOpacity(0.8), fontSize: 18),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimension.screenWidth(context) * 1 / 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...[
                        KeyValueRow(
                            keyText: "national_number".tr(),
                            value: createClientResponseModel!
                                .clientNationalNumberOrDisabilityNumber
                                .toString()),
                        KeyValueRow(
                            keyText: "unit_name".tr(), value: selectedUnitName),
                        //  KeyValueRow(keyText: "رقم الدور", value: "0-00012"),
                        KeyValueRow(
                            keyText: "date".tr(),
                            value: DateTime.now()
                                .toString()
                                .split(" ")[0]
                                .toString()),
                      ].expand((element) => [
                            element,
                            const SizedBox(
                              height: 8,
                            )
                          ]),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  AppDimension.screenWidth(context) * 2 / 10),
                          height: 50,
                          child: MainElevatedButton(
                            onTap: () {
                              Navigation.push(
                                  context,
                                  WaitingListPage(
                                    myMinistryModel: myMinistryModel,
                                    ministryModel: ministryModel,
                                  ));
                            },
                            text: "finish_process".tr(),
                          ))
                    ],
                  ),
                ),
              ].expand((element) => [
                    element,
                    const SizedBox(
                      height: 16,
                    )
                  ])
            ]));
  }
}
