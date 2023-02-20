import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';

import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/CreateModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/widgets/custom_text_field.dart';

import '../../../select_unit_journy/data/my_ministriy_model.dart';
import '../../../select_unit_journy/presentation/widgets/center_logo.dart';
import '../../../select_unit_journy/presentation/widgets/main_elevated_button.dart';
import '../../data/create_client_request_model.dart';
import '../../data/create_client_response_model.dart';
import '../../repository/create_client_request_repository.dart';
import 'confirm_booking_page.dart';

class NationalNumberPage extends StatelessWidget {
  final int? selectedUnitId;
  final int? selectedDepartmentId;
  final int? disabilityCategoryId;
  final String? selectedUnitName;
  final MyMinistryModel? myMinistryModel;

  NationalNumberPage(
      {Key? key,
      this.selectedDepartmentId,
      this.selectedUnitId,
      this.disabilityCategoryId,
      this.selectedUnitName,
      this.myMinistryModel})
      : super(key: key);

  final _formKey = GlobalKey<FormState>();

  TextEditingController? numberController = TextEditingController();
  CreateClientRequestModel? _clientRequestModel;

  @override
  Widget build(BuildContext context) {
    _clientRequestModel = CreateClientRequestModel(
        clientNationalNumberOrDisabilityNumber: "",
        unitId: selectedUnitId,
        disabilityCategoryId:disabilityCategoryId );
    return Scaffold(
        //resizeToAvoidBottomInset: true,
        body: Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: AppDimension.screenWidth(context) * 3 / 10, vertical: 24),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ...[
            CenterLogo(logoUrl: myMinistryModel!.attachment!.url!),
            Text("enter_national_number".tr(), style: AppTheme.bodyText1),
            CustomTextField(
              controller: numberController,
              hintText: "national_number".tr(),
              validator: (value) {
                //   Validator.numberValidate(value!, context);
              },
              onChanged: (nationalNumber) {
                _clientRequestModel!.clientNationalNumberOrDisabilityNumber =
                    nationalNumber;
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
              required: true,
            ),
            _buildSubmitButton(context)
          ].expand((element) => [element, const SizedBox(height: 16)])
        ]),
      ),
    ));
  }

  CreateModelCubit? _createRequestModelCubit;

  _buildSubmitButton(context) {
    return CreateModel<CreateClientResponseModel>(
      onSuccess: (CreateClientResponseModel model) {
        Navigation.push(
            context,
            ConfirmBookingPage(
              myMinistryModel: myMinistryModel,
              createClientResponseModel: model,
              selectedUnitName: selectedUnitName,
            ));
      },
      repositoryCallBack: (data) =>
          CreateClientRequestRepository.createRequest(data),
      onCubitCreated: (CreateModelCubit cubit) {
        _createRequestModelCubit = cubit;
      },
      child: MainElevatedButton(
          text: "next".tr(),
          onTap: () {
            _createRequestModelCubit!.createModel(_clientRequestModel);
          }),
    );
  }
}
