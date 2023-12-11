import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/features/call_reception/presentation/pages/welcome_call_reception_page.dart';

import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/CreateModel.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimension.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/default_scaffold.dart';
import '../../../select_unit_journy/data/my_ministriy_model.dart';
import '../../../select_unit_journy/presentation/widgets/main_elevated_button.dart';
import '../../data/create_call_request.dart';
import '../../repository/call_reception_repo.dart';

class ClientNameScreen extends StatelessWidget {
  final MyMinistryModel? myMinistryModel;
  final int? departmentId;
  final int? leaderId;

  ClientNameScreen(
      {Key? key, this.departmentId, this.leaderId, this.myMinistryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController? nameController = TextEditingController();

    return DefaultScaffold(
      logoUrl: myMinistryModel!.attachment!.url,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension.screenWidth(context) / 4),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                ...[
                  Text(
                    "select_client_name".tr(),
                    style: AppTheme.headline3,
                  ),
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
                    onChanged: (value) {},
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
                  ),
                  MainElevatedButton(
                      text: "next".tr(),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _showConfirmDialog(context, leaderId,
                              nameController.text, departmentId);
                        }
                      })
                ].expand((element) => [element, const SizedBox(height: 16)])
              ]),
            ),
          ),
        ),
      ),
    );
  }

  CreateModelCubit? cubit;

  _showConfirmDialog(context, leaderId, String clientName, departmentId) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: Text(
                'are_you_sure'.tr(),
                style: AppTheme.headline3,
              ),
              actions: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CreateModel(
                        repositoryCallBack: (data) =>
                            CallReceptionRepo.createCards(data),
                        onCubitCreated: (CreateModelCubit c) {
                          cubit = c!;
                        },
                        onSuccess: (model) {
                          Navigator.pop(context);
                          Navigation.pushAndRemoveUntil(
                              context, WelcomeCallReceptionPage());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 8,
                          height: 75,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: TextButton(
                              child: Text('yes'.tr(),
                                  style: AppTheme.bodyText1
                                      .copyWith(color: Colors.white)),
                              onPressed: () {
                                //  myMinistryModel!.screens=[];
                                if (myMinistryModel!.screens != null) {
                                  if (myMinistryModel!.screens!.length > 0) {
                                    cubit!.createModel(CreateCallRequest(
                                        leaderId: leaderId,
                                        clientName: clientName,
                                        screenId:
                                            myMinistryModel!.screens![0].id,
                                        departmentId: departmentId));
                                  } else {
                                    _showAlertForCreateScreen(context);
                                  }
                                } else {
                                  _showAlertForCreateScreen(context);
                                }
                              }),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: MediaQuery.of(context).size.width / 8,
                        height: 75,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: AppColors.lightBlueColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: TextButton(
                            onPressed: () {
                              Navigation.pop(context);
                            },
                            child: Text('no'.tr(),
                                style: AppTheme.headline3
                                    .copyWith(color: AppColors.white))),
                      ),
                    ],
                  ),
                ),
              ]);
        });
  }

  _showAlertForCreateScreen(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: Text('you_need_create_screen_account'.tr()),
            actions: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 8,
                  height: 50,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: TextButton(
                      onPressed: () {
                        Navigation.pop(context);
                        Navigation.pop(context);
                      },
                      child: Text('ok'.tr(),
                          style: AppTheme.bodyText2
                              .copyWith(color: AppColors.white))),
                ),
              ),
            ],
          );
        });
  }
}
