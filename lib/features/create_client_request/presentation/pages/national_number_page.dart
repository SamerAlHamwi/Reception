import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';

import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/CreateModel.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/default_scaffold_with_center_logo.dart';
import '../../../select_unit_journy/data/my_ministriy_model.dart';
import '../../../select_unit_journy/presentation/widgets/main_elevated_button.dart';
import '../../data/create_client_request_model.dart';
import '../../data/create_client_response_model.dart';
import '../../repository/create_client_request_repository.dart';
import 'confirm_booking_page.dart';

class NationalNumberPage extends StatefulWidget {
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

  @override
  State<NationalNumberPage> createState() => _NationalNumberPageState();
}

class _NationalNumberPageState extends State<NationalNumberPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? numberController = TextEditingController();
  TextEditingController? transactionNumberController = TextEditingController();

  TextEditingController? nameController = TextEditingController();

  CreateClientRequestModel? _clientRequestModel = CreateClientRequestModel();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffoldWithCenterLogo(
        //resizeToAvoidBottomInset: true,
        logoUrl: widget.myMinistryModel!.attachment!.url!,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension.screenWidth(context) / 4),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                ...[
                  const SizedBox(height: 8),
                  // Text(
                  //     myMinistryModel!.ministryRequestType == 1
                  //         ? "enter_national_number".tr()
                  //         : "enter_disability_number".tr(),
                  //     style: AppTheme.bodyText1),
                  CustomTextField(
                    controller: nameController,
                    hintText: "name".tr(),
                    validator: (value) {
                      if (value == null) {
                        return 'please_enter_name'.tr();
                      }
                      if (value!.isEmpty) {
                        return 'please_enter_name'.tr();
                      }
                      return null;

                      //   Validator.numberValidate(value!, context);
                    },
                    onChanged: (value) {
                      _clientRequestModel!.clientFullName = value;
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
                    required: true,
                  ),  CustomTextField(
                    controller: transactionNumberController,
                    hintText:  "transactionNumber".tr(),
                    validator: (value) {
                      return null;
                      // return validateNationalOrDisabilityNumber(value);
                      //   Validator.numberValidate(value!, context);
                    },
                    onChanged: (value) {
                      _clientRequestModel!.transactionNumber=double.tryParse(value);
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
                    required: false,
                  ),
                  CustomTextField(
                    controller: numberController,
                    hintText: widget.myMinistryModel!.ministryRequestType == 1
                        ? "national_number".tr()
                        : "disability_number".tr(),
                    validator: (value) {
                     return validateNationalOrDisabilityNumber(value);
                      //   Validator.numberValidate(value!, context);
                    },
                    onChanged: (value) {
                      widget.myMinistryModel!.ministryRequestType == 1
                          ? _clientRequestModel!.clientNationalNumber = value
                          : _clientRequestModel!.disabilityNumber = value;
                    },
                    textInputAction: TextInputAction.next,
                    maxLength: widget.myMinistryModel!.ministryRequestType == 1
                        ? 12
                        : 6,
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
                    required: true,
                  ),
                  _buildSubmitButton(context)
                ].expand((element) => [element, const SizedBox(height: 16)])
              ]),
            ),
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
              myMinistryModel: widget.myMinistryModel,
              createClientResponseModel: model,
              selectedUnitName: widget.selectedUnitName,
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
            _clientRequestModel!.unitId = widget.selectedUnitId;
            _clientRequestModel!.disabilityCategoryId =
                widget.disabilityCategoryId;
                  if (_formKey.currentState!.validate()) {
                    _createRequestModelCubit!.createModel(_clientRequestModel);
                  }

          }),
    );
  }

  // _isValidNumber(String? value) {
  //   if (value == null) {
  //     return false;
  //   }
  //   if (value.length < 1) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }
 String? validateNationalOrDisabilityNumber(String? value)
  {
    if( widget.myMinistryModel!.ministryRequestType == 1){
    if (value == null) {
      return 'not_valid_national_number'.tr();
    }
    else if (value!.isEmpty||value!.length<12) {
      return 'not_valid_national_number'.tr();
    }
    else return null;
    }
    else if(widget.myMinistryModel!.ministryRequestType == 2){
      if (value == null) {
        return 'please_enter_disability_number'.tr();
      }
      else if (value!.isEmpty) {
        return 'please_enter_disability_number'.tr();
      }
      else return null;
    }
   else return null;


  }



}
