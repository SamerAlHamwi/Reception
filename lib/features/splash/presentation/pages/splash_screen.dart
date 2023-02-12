import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';


import '../../../../core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_settings.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/utils/shared_storage.dart';

class Splash extends StatelessWidget {
  final dynamic navigator;

  Splash({Key? key, this.navigator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 80,
      logo: Image.asset(
        AppAssets.appLogoURI,
        height: 180,
        alignment: Alignment.bottomCenter,
      ),
      //  title: const Text("Business Game",style: TextStyle(color: AppColors.white,fontSize: 14,letterSpacing: 8),),
      showLoader: true,
      //backgroundImage: const AssetImage(AppAssets.splashBackgroundURI),
      loaderColor: AppColors.white,
      loadingText: Text(AppSettings.appVersion,
          style: AppTheme.headline6.copyWith(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w200)),
      futureNavigator: futureCall(context),
    );
  }

  GetModelCubit? getModelCubit;
  Future<Widget> futureCall(context) async {
    return Future.delayed(const Duration(seconds: 3), () {
      print("SharedStorage.getLanguage()");
      print(SharedStorage.getLanguage());
      //SettingRepository.changeLanguage(SharedStorage.getLanguage());
      return navigator;

//      return GetModel<EmptyModel>(
//          repositoryCallBack: (data) =>
//              SettingRepository.changeLanguage(SharedStorage.getLanguage()),
//          onSuccess: (EmptyModel model)
//          {
//
//          },
//          onCubitCreated: (GetModelCubit? cubit) => getModelCubit = cubit,
//          modelBuilder: (EmptyModel model) {
//            return   navigator;
//      });
    });
  }
}
