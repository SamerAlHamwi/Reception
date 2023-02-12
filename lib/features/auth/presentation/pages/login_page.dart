import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../features/home/presentation/pages/home_page.dart';

import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/CreateModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/utils/shared_storage.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../data/login_request_model.dart';
import '../../data/login_response_model.dart';
import '../../repository/authentication_repository.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController password = TextEditingController();
  LoginRequestModel _loginRequestModel =
      LoginRequestModel(rememberClient: true);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage(AppAssets.background),fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: LayoutBuilder(builder: (context, sizes) {
                return Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: sizes.maxHeight * 3 / 10,
                            child: CustomImage.circular(
                              image: AppAssets.appLogoURI,
                              radius: 200,
                              isNetworkImage: false,
                              svg: false,
                            ),
                          ),
                          Container(
                            height: sizes.maxHeight * 7 / 10,
                            padding: EdgeInsets.symmetric(
                                horizontal: sizes.maxWidth / 10),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ...[
                                    CustomTextField(
                                      hintText: 'user_name'.tr(),
                                      validator: (value) {
                                        Validator.nameValidate(value!, context);
                                      },
                                      controller: password,
                                      onChanged: (userName) {
                                        _loginRequestModel
                                            .userNameOrEmailAddress = userName;
                                      },
                                      textInputAction: TextInputAction.next,
                                      inputDecoration: AppTheme.inputDecoration
                                          .copyWith(
                                              prefixIcon: Icon(Icons.person,
                                                  color: AppColors.grey)),
                                      keyboardType: TextInputType.text,
                                      required: true,
                                      general: false,
                                    ),
                                    CustomTextField(
                                      hintText: 'password'.tr(),
                                      required: true,
                                      obscureText: true,
                                      validator: (value) {
                                        Validator.passwordValidate(
                                            value!, context);
                                      },
                                      inputDecoration: AppTheme.inputDecoration
                                          .copyWith(
                                              prefixIcon: Icon(
                                                  Icons.key_rounded,
                                                  color: AppColors.grey)),
                                      onChanged: (email) {
                                        _loginRequestModel.password = email;
                                      },
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      general: false,
                                    ),
                                    // ElevatedButton(onPressed: (){}, child:Text("تسجيل الدخول")),
                                    _buildLoginButton(context)
                                  ].expand((element) => [
                                        element,
                                        SizedBox(
                                          height: 24,
                                        )
                                      ]),
                                ]),
                          )
                        ]));
              }),
            )));
  }

  CreateModelCubit? loginCubit;

  _buildLoginButton(context) {
    return CreateModel<LoginResponseModel>(
        onSuccess: (LoginResponseModel model) {
          SharedStorage.writeToken(model.accessToken);
          Navigation.pushAndRemoveUntil(context, HomePage());
        },
        repositoryCallBack: (data) =>
            AuthenticationRepository.authenticateLogIn(data),
        onCubitCreated: (CreateModelCubit cubit) {
          loginCubit = cubit;
        },
        child: InkWell(
            onTap: () {
              var valid = _formKey.currentState!.validate();
              if (valid && loginCubit != null) {
                FocusScope.of(_formKey.currentState!.context).unfocus();
                loginCubit!.createModel(_loginRequestModel);
              } else {
                return;
              }
            },
            child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        colors: [
                          AppColors.lightBlueColor,
                          AppColors.blueColor,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)),
                child: Center(
                    child: Text(
                  "login".tr(),
                  style: AppTheme.bodyText1.copyWith(color: AppColors.white),
                )))));
  }
}
