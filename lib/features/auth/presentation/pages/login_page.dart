import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/CreateModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimension.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/utils/shared_storage.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../my_app.dart';
import '../../../select_unit_journy/presentation/pages/welcome_reception_page.dart';
import '../../../unit_screen/presentation/pages/unit_screen_page.dart';
import '../../data/login_request_model.dart';
import '../../data/login_response_model.dart';
import '../../repository/authentication_repository.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginRequestModel _loginRequestModel = LoginRequestModel(
      rememberClient: true, password: "", userNameOrEmailAddress: "");
  final _formKey = GlobalKey<FormState>();
  TextEditingController? password;
  TextEditingController? userName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    password = TextEditingController(text: _loginRequestModel.password);
    userName = TextEditingController(text: _loginRequestModel.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding:
                EdgeInsets.only(top: AppDimension.screenHeight(context) / 10),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(children: [
                    ...[
                      CustomImage.rectangle(
                        image: AppAssets.disabledLogo,
                        isNetworkImage: false,
                        fit: BoxFit.fill,
                        height: AppDimension.screenHeight(context) / 3,
                        width: AppDimension.screenWidth(context) / 5,
                        svg: false,
                      ),
                      SizedBox(
                        width: AppDimension.screenWidth(context) / 2.5,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ...[
                                CustomTextField(
                                  controller: userName,
                                  hintText: 'user_name'.tr(),
                                  validator: (value) {
                                    Validator.nameValidate(value!, context);
                                  },
                                  onChanged: (userName) {
                                    _loginRequestModel.userNameOrEmailAddress =
                                        userName;
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
                                  controller: password,
                                  hintText: 'password'.tr(),
                                  required: true,
                                  onEditComplete: (){
                                    var valid = _formKey.currentState!.validate();
                                    if (valid && loginCubit != null) {
                                      FocusScope.of(_formKey.currentState!.context).unfocus();
                                      loginCubit!.createModel(_loginRequestModel);
                                    } else {
                                      return;
                                    }
                                  },
                                  obscureText: true,
                                  validator: (value) {
                                    Validator.passwordValidate(value!, context);
                                  },
                                  inputDecoration: AppTheme.inputDecoration
                                      .copyWith(
                                          prefixIcon: Icon(Icons.key_rounded,
                                              color: AppColors.grey)),
                                  onChanged: (email) {
                                    _loginRequestModel.password = email;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  general: false,

                                ),
                                _buildLoginButton(context)
                              ].expand((element) => [
                                    element,
                                    const SizedBox(
                                      height: 16,
                                    )
                                  ]),
                            ]),
                      )
                    ].expand((element) => [
                          element,
                          const SizedBox(
                            height: 16,
                          )
                        ])
                  ]),
                ))));
  }

  CreateModelCubit? loginCubit;

  _buildLoginButton(context) {
    return CreateModel<LoginResponseModel>(
        onSuccess: (LoginResponseModel model) {
            Navigation.pushAndRemoveUntil(context,  MyApp.getNextPage());

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
                height: 70,
                width: AppDimension.screenWidth(context) / 3,
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
