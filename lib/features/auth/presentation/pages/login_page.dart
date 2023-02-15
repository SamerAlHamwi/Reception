import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/features/select_department_journy/presentation/widgets/main_elevated_button.dart';

import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/CreateModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/utils/shared_storage.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../select_department_journy/presentation/pages/welcome_page.dart';
import '../../data/login_request_model.dart';
import '../../data/login_response_model.dart';
import '../../repository/authentication_repository.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? password ;
  TextEditingController? userName ;

  LoginRequestModel _loginRequestModel =
      LoginRequestModel(rememberClient: true,password: "",userNameOrEmailAddress: "");

  final _formKey = GlobalKey<FormState>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    password = TextEditingController(text: _loginRequestModel.password);
    userName = TextEditingController(text: _loginRequestModel.userNameOrEmailAddress);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: LayoutBuilder(builder: (context, sizes) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: sizes.maxWidth / 5),
                  child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: sizes.maxHeight * 3 / 10,
                              child: CustomImage.circular(
                                image: AppAssets.disabledLogo,
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
                                        controller: userName,
                                        hintText: 'user_name'.tr(),
                                        validator: (value) {
                                          Validator.nameValidate(
                                              value!, context);
                                        },
                                        onChanged: (userName) {
                                          _loginRequestModel
                                                  .userNameOrEmailAddress =
                                              userName;
                                        },
                                        textInputAction: TextInputAction.next,
                                        inputDecoration:
                                            AppTheme.inputDecoration.copyWith(
                                                prefixIcon: Icon(Icons.person,
                                                    color: AppColors.grey)),
                                        keyboardType: TextInputType.text,
                                        required: true,
                                        general: false,
                                      ),
                                      CustomTextField(
                                        controller: password,
                                        hintText: 'password'.tr(),
                                        required: true,
                                        obscureText: true,
                                        validator: (value) {
                                          Validator.passwordValidate(
                                              value!, context);
                                        },
                                        inputDecoration:
                                            AppTheme.inputDecoration.copyWith(
                                                prefixIcon: Icon(
                                                    Icons.key_rounded,
                                                    color: AppColors.grey)),
                                        onChanged: (email) {
                                          _loginRequestModel.password = email;
                                        },
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                          ])),
                );
              }),
            )));
  }

  CreateModelCubit? loginCubit;

  _buildLoginButton(context) {
    return CreateModel<LoginResponseModel>(
        onSuccess: (LoginResponseModel model) {
          SharedStorage.writeToken(model.accessToken);
          Navigation.pushAndRemoveUntil(context, WelcomePage());
        },
        repositoryCallBack: (data) =>
            AuthenticationRepository.authenticateLogIn(data),
        onCubitCreated: (CreateModelCubit cubit) {
          loginCubit = cubit;
        },
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: MainElevatedButton(
            onTap: () {
              var valid = _formKey.currentState!.validate();
              if (valid && loginCubit != null) {
                FocusScope.of(_formKey.currentState!.context).unfocus();
                loginCubit!.createModel(_loginRequestModel);
              } else {
                return;
              }
            },
            text: "login".tr(),
          ),
        ));
  }
}
