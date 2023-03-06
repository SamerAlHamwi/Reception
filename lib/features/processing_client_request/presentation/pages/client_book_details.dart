import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';
import 'package:ministries_reception_app/core/utils/shared_storage.dart';

import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/frequently_used_function/frequenty_funtions.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/widgets/default_scaffold.dart';
import '../../../select_unit_journy/presentation/widgets/main_elevated_button.dart';
import '../../../unit_screen/data/clients_requests_model.dart';
import '../../data/one_request_model.dart';
import '../../data/time_model.dart';
import '../../repository/processing_request_repository.dart';
import '../widgets/time_row.dart';
import 'job_number_page.dart';

class ClientBookDetails extends StatelessWidget {
  final String? logoUrl;
  final int? requestId;
  final OneClientRequest? oneClientRequest;

  const ClientBookDetails(
      {Key? key, this.logoUrl, this.requestId, this.oneClientRequest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return DefaultScaffold(
        logoUrl: logoUrl,
        body: GetModel<OneClientRequestModel>(
            repositoryCallBack: (data) =>
                ProcessingRequestRepository.getOneRequestDetails(requestId!),
            modelBuilder: (OneClientRequestModel _oneClientRequestModel) {
              Duration waitingDuration = FrequentlyFunction.convertSecondsToDuration(
                  _oneClientRequestModel!.waitingSeconds);
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimension.screenWidth(context) * 2 / 10),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...[
                      Text(
                        "request_number".tr() +
                            " " +
                            oneClientRequest!.orderNumber!,
                        style: AppTheme.bodyText1,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ...[
                              Text(
                                "waiting_time".tr(),
                                style: AppTheme.bodyText1
                                    .copyWith(color: AppColors.lightBlueColor),
                              ),
                              TimeRow(
                                timeModel: TimeModel(
                                    second: waitingDuration
                                        .toString()
                                        .split(":")[2]
                                        .split('.')[0],
                                    minutes: waitingDuration
                                        .toString()
                                        .split(":")[1],
                                    hour: waitingDuration
                                        .toString()
                                        .split(":")[0]),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(16),
                                  color: AppColors.white,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(oneClientRequest!.orderNumber!),
                                        Text(oneClientRequest!.unit!.name!),

                                        Text(SharedStorage
                                            .getMinistryRequestType() ==
                                                1
                                            ? _oneClientRequestModel!
                                                .clientNationalNumber??""
                                            : _oneClientRequestModel!
                                                .disabilityNumber!??""),

                                      ]))
                            ].expand(
                              (element) => [element, const SizedBox(height: 8)],
                            ),
                          ],
                        ),
                      ),
                      MainElevatedButton(
                        text: "enter_job_id".tr(),
                        onTap: () {
                          Navigation.push(
                              context,
                              JobNumberPage(
                                  logoUrl: logoUrl,
                                  oneClientRequest: oneClientRequest));
                        },
                      )
                    ].expand((element) => [
                          element,
                          const SizedBox(
                            height: 8,
                          )
                        ])
                  ],
                ),
              );
            }));
  }
}
