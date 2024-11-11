

import 'package:flutter/material.dart';
import '../../../core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_dimension.dart';
import '../../../core/utils/navigation.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../my_app.dart';
import '../../auth/presentation/pages/login_page.dart';
import '../../auth/repository/authentication_repository.dart';
import '../data/app_update_model.dart';
import 'app_update_screen.dart';


class CheckUpdateScreen extends StatefulWidget {
  const CheckUpdateScreen({super.key});

  @override
  State<CheckUpdateScreen> createState() => _CheckUpdateScreenState();
}

class _CheckUpdateScreenState extends State<CheckUpdateScreen> {


  late GetModelCubit updateCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          right: 16,
          left: 16,
        ),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
        child: GetModel<AppUpdateModel>(
            onSuccess: (AppUpdateModel model){
              if(model.appFilePath != null && model.appFilePath!.isNotEmpty){
                Navigation.push(context,UpdateScreen(appUpdateModel: model,));
              }else{
                Navigation.push(context,MyApp.getNextPage());
              }
            },
            modelBuilder: (AppUpdateModel model) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: AppDimension.screenHeight(context) / 4,
                    child: CustomImage.circular(
                      image: AppAssets.disabledLogo,
                      radius: 200,
                      isNetworkImage: false,
                      svg: false,
                    ),
                  ),
                ],
              );
            },
            repositoryCallBack: (data) => AuthenticationRepository.checkAppUpdate(),
            onCubitCreated: (GetModelCubit cubit) {
              updateCubit = cubit;
            },
            loading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: AppDimension.screenHeight(context) / 4,
                  child: CustomImage.circular(
                    image: AppAssets.disabledLogo,
                    radius: 200,
                    isNetworkImage: false,
                    svg: false,
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }

}


