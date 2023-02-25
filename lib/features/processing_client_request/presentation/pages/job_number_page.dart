import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';

import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/CreateModel.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/frequently_used_function/frequenty_funtions.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/default_scaffold_with_center_logo.dart';
import '../../../create_client_request/data/create_client_request_model.dart';
import '../../../create_client_request/data/create_client_response_model.dart';
import '../../../create_client_request/repository/create_client_request_repository.dart';
import '../../../select_unit_journy/presentation/widgets/main_elevated_button.dart';
import '../../../unit_screen/data/clients_requests_model.dart';
import 'confirm_finish_client_request_page.dart';

class JobNumberPage extends StatelessWidget {
  TextEditingController? numberController = TextEditingController(text: "");
  final String? logoUrl;
  final OneClientRequest? oneClientRequest;
  CreateClientRequestModel? _clientRequestModel = CreateClientRequestModel();

  JobNumberPage({Key? key, this.logoUrl, this.oneClientRequest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffoldWithCenterLogo(
        //resizeToAvoidBottomInset: true,
        logoUrl: logoUrl,
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension.screenWidth(context) / 4),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              ...[
                Text("enter_job_id".tr(), style: AppTheme.bodyText1),
                CustomTextField(
                  controller: numberController,
                  maxLength: 20,
                  hintText: "job_id".tr(),
                  validator: (value) {
                    Validator.numberValidate(value!, context);
                  },
                  onChanged: (employeetreatNumber) {
                    _clientRequestModel!.employeetreatNumber =
                        employeetreatNumber;
                  },
                  textInputAction: TextInputAction.next,
                  inputDecoration: AppTheme.inputDecoration.copyWith(
                      prefixIcon: null,
                      fillColor: AppColors.white,
                      focusColor: AppColors.white,
                      enabledBorder: AppStyles.inputDecorationBorder.copyWith(
                        borderSide: const BorderSide(
                          style: BorderStyle.solid,
                          width: 0.4,
                          color: AppColors.white,
                        ),
                      )),
                  keyboardType: TextInputType.number,
                  general: false,
                  withOutPadding: true,
                  autofocus: true,
                ),
                _buildSubmitButton(context)
              ].expand((element) => [element, SizedBox(height: 16)])
            ]),
          ),
        ));
  }

  CreateModelCubit? _updateRequestModelCubit;

  _buildSubmitButton(context) {
    return CreateModel<CreateClientResponseModel>(
        onSuccess: (CreateClientResponseModel model) {
          Navigation.push(
              context,
              ConfirmFinishClientRequestPage(
                logoUrl: logoUrl,
                oneClientRequest: oneClientRequest,
              ));
        },
        repositoryCallBack: (data) =>
            CreateClientRequestRepository.createRequest(data, isEdit: true),
        onCubitCreated: (CreateModelCubit cubit) {
          _updateRequestModelCubit = cubit;
        },
        child: MainElevatedButton(
            text: "next".tr(),
            onTap: () {
              _clientRequestModel!.id = oneClientRequest!.id;
              _clientRequestModel!.unitId = oneClientRequest!.unitId;
              _clientRequestModel!.disabilityCategoryId =
                  oneClientRequest!.disabilityCategory!.id;
              _clientRequestModel!.disabilityNumber =
                  oneClientRequest!.disabilityNumber;
              _clientRequestModel!.clientNationalNumber =
                  oneClientRequest!.clientNationalNumber;

              if (FrequentlyFunction.isValidNumber(
                  _clientRequestModel!.employeetreatNumber)) {
                _clientRequestModel!.treatTime = DateTime.now().toString();
                _updateRequestModelCubit!.createModel(_clientRequestModel);
              }
            }));
  }
}
