import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';

import '../../../../core/api/core_models/empty_model.dart';
import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/CreateModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../select_department_journy/data/my_ministriy_model.dart';
import '../../../select_department_journy/presentation/widgets/main_elevated_button.dart';
import '../../data/create_client_request_model.dart';
import '../../repository/create_client_request_repository.dart';
import 'confirm_booking_page.dart';

class NationalNumberPage extends StatelessWidget {
  final int? selectedUintId;
  final int? selectedDepartmentId;
  final int? disabilityCategoryId;
  final MyMinistriyModel? ministriyModel;
  CreateClientRequestModel? _clientRequestModel;
  TextEditingController? numberController = TextEditingController(text:"");

  // CreateClientRequestModel(clientNationalNumberOrDisabilityNumber: "",unitId:selectedUintId,disabilityCategoryId: selectedUintId);

  NationalNumberPage(
      {Key? key,
      this.selectedDepartmentId,
      this.selectedUintId,
      this.disabilityCategoryId,
      this.ministriyModel})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    _clientRequestModel=  CreateClientRequestModel(clientNationalNumberOrDisabilityNumber: "",unitId:selectedUintId,disabilityCategoryId: selectedUintId);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension.screenWidth(context) * 3 / 10,
                vertical: 24),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ...[
                Container(
                  alignment: Alignment.center,
                  height: AppDimension.screenHeight(context) * 3 / 10,
                  child: CustomImage.circular(
                    image: ministriyModel!.attachment!.url!,
                    radius: 200,
                    isNetworkImage: true,
                    svg: false,
                  ),
                ),
                Text("enter_national_number".tr(), style: AppTheme.bodyText1),
                CustomTextField(
                  controller:numberController ,
                  hintText: "national_number".tr(),
                  validator: (value) {
                    Validator.numberValidate(value!, context);
                  },
                  onChanged: (nationalNumber) {
                    _clientRequestModel!.clientNationalNumberOrDisabilityNumber = nationalNumber;
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
                  keyboardType: TextInputType.text,
                  general: false,
                  withOutPadding: true,
                  autofocus: true,
                ),
                _buildSubmitButton(context)
              ].expand((element) => [element, SizedBox(height: 16)])
            ])));
  }

  CreateModelCubit? _createRequestModelCubit;

  _buildSubmitButton(context) {
    return CreateModel<EmptyModel>(
      onSuccess: (EmptyModel model) {
        Navigation.push(context, ConfirmBookingPage());
      },
      repositoryCallBack: (data) =>
          CreateClientRequestRepository.createRquest(data),
      onCubitCreated: (CreateModelCubit cubit) {
        _createRequestModelCubit = cubit;
      },
      child: MainElevatedButton(
          text: "next".tr(),
          onTap: () {
            _clientRequestModel!.treatTime= DateTime.now().toString();
            _createRequestModelCubit!.createModel(_clientRequestModel);
          }),
    );
  }
}
