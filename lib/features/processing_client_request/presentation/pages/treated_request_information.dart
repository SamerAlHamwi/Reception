import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';
import 'package:ministries_reception_app/core/utils/shared_storage.dart';

import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/widgets/default_scaffold.dart';
import '../../../select_unit_journy/presentation/widgets/main_elevated_button.dart';
import '../../../unit_screen/data/clients_requests_model.dart';
import '../../data/one_request_model.dart';
import '../../repository/processing_request_repository.dart';

class TreatedRequestInformation extends StatelessWidget {
  final String? logoUrl;
  final int? requestId;
  final OneClientRequest? oneClientRequest;

  const TreatedRequestInformation(
      {Key? key, this.logoUrl, this.requestId, this.oneClientRequest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        logoUrl: logoUrl,
        body: GetModel<OneClientRequestModel>(
            repositoryCallBack: (data) =>
                ProcessingRequestRepository.getOneRequestDetails(requestId!),
            modelBuilder: (OneClientRequestModel oneClientRequestModel) {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimension.screenWidth(context) * 2 / 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.security_outlined,
                      color: AppColors.lightBlueColor,
                      size: 60,
                    ),
                    Text(
                      "request_information".tr(),
                      style: AppTheme.headline3,
                    ),
                    const SizedBox(height: 16),
                    Container(
                        padding: const EdgeInsets.all(16),
                        // color: AppColors.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ...[
                                SharedStorage.getMinistryRequestType() == 1
                                    ? _buildRowInformation(
                                        'national_number_for_client'.tr(),
                                        oneClientRequestModel
                                                .clientNationalNumber ??
                                            "")
                                    : _buildRowInformation(
                                        'disability_number'.tr(),
                                        oneClientRequestModel.disabilityNumber!),
                                _buildRowInformation('unit_name'.tr(),
                                    oneClientRequest!.unit!.name!),
                                _buildRowInformation('job_id'.tr(),
                                    oneClientRequest!.employeetreatNumber!),
                                _buildRowInformation(
                                    'request_processing_date'.tr(),
                                    oneClientRequest!.treatTime!
                                        .split('T')[0]),
                                _buildRowInformation(
                                    'request_processing_time'.tr(),
                                    DateTime.tryParse('${oneClientRequest!.treatTime!}Z')!
                                        .toLocal().toString().split(' ')[1].split('.')[0]),
                              ].expand((element) =>
                                  [element, const SizedBox(height: 8)])
                            ])),
                    const SizedBox(height: 16),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                AppDimension.screenWidth(context) * 2 / 10),
                        child: MainElevatedButton(
                          height: 60,
                          onTap: () {
                            Navigation.pop(context);
                          },
                          text: 'ok'.tr(),
                        ))
                  ],
                ),
              );
            }));
  }

  _buildRowInformation(key, value) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        key,
        style: AppTheme.bodyText1,
      ),
      Text(
        " : ",
        style: AppTheme.bodyText1,
      ),
      Text(
        value,
        style: AppTheme.bodyText1,
      ),
    ]);
  }
}
