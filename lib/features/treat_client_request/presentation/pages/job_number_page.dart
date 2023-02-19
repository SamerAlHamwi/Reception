import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';
import 'package:ministries_reception_app/core/widgets/default_scaffold.dart';

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
import 'confirm_finish_client_request_page.dart';

class JobNumberPage extends StatelessWidget {
  TextEditingController? numberController = TextEditingController(text:"");

  JobNumberPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: true,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension.screenWidth(context) * 3 / 10,
                vertical: 24),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                ...[
                  Container(
                    alignment: Alignment.center,
                    height: AppDimension.screenHeight(context) * 3 / 10,
                    child: CustomImage.circular(
                      image: AppAssets.appLogoURI,
                      radius: 200,
                      isNetworkImage: false,
                      svg: false,
                    ),
                  ),
                  Text("enter_job_id".tr(), style: AppTheme.bodyText1),
                  CustomTextField(
                    controller: numberController,
                    hintText: "job_id".tr(),
                    validator: (value) {
                      Validator.numberValidate(value!, context);
                    },
                    onChanged: (nationalNumber) {
                  /*    _clientRequestModel!
                              .clientNationalNumberOrDisabilityNumber =
                          nationalNumber;*/
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
            )));
  }

  CreateModelCubit? _createRequestModelCubit;

  _buildSubmitButton(context) {
    return /*CreateModel<EmptyModel>(
      onSuccess: (EmptyModel model) {
        Navigation.push(context, ConfirmBookingPage());
      },
      repositoryCallBack: (data) =>
          CreateClientRequestRepository.createRquest(data),
      onCubitCreated: (CreateModelCubit cubit) {
        _createRequestModelCubit = cubit;
      },
      child: */MainElevatedButton(
          text: "next".tr(),
          onTap: () {
            Navigation.push(context, ConfirmFinishClientRequestPage());

            // _clientRequestModel!.treatTime = DateTime.now().toString();
            //_createRequestModelCubit!.createModel(_clientRequestModel);
          });
   // );
  }
}
