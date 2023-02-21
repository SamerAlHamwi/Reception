import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/features/select_unit_journy/presentation/widgets/main_elevated_button.dart';
import 'package:ministries_reception_app/features/waiting_client_list/presentation/pages/waiting_list_page.dart';

import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_dimension.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/utils/navigation.dart';
import '../../data/my_ministriy_model.dart';
import '../../repository/ministriey_repo.dart';
import '../widgets/center_logo.dart';
import 'disabled_gategory_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetModel<MyMinistryModel>(
        repositoryCallBack: (data) => MinistrieyRepo.getMyMinistries(),
        modelBuilder: (MyMinistryModel myMinistryModel) {
          return Scaffold(
              body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child: SizedBox(
              height: AppDimension.screenHeight(context) * 9 / 10,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...[
                      CenterLogo(logoUrl: myMinistryModel.attachment!.url!),
                      Text(
                        myMinistryModel!.name ?? "",
                        style: AppTheme.headline3,
                      ),
                      Text(
                        myMinistryModel!.description ?? "",
                        style: AppTheme.headline3,
                      ),Padding(padding: EdgeInsets.symmetric(horizontal: AppDimension.screenWidth(context)/4)
                        ,child:
                      Column(
                        children: [...[
                          MainElevatedButton(
                            onTap: () {
                              Navigation.push(
                                  context,
                                  WaitingListPage(
                                      myMinistryModel: myMinistryModel));
                            },
                            text: "waiting_list".tr(),
                          ),MainElevatedButton(
                            onTap: () {
                              Navigation.push(
                                  context,
                                  DisabledCategoryPage(
                                      myMinistryModel: myMinistryModel));
                            },
                            text: "create_new_client_request".tr(),
                          ),
                        ].expand((element) => [SizedBox(height: 16),element])],
                      ),)
                      /*InkWell(
                          onTap: () {
                            Navigation.push(
                                context,
                                DisabledCategoryPage(
                                    myMinistryModel: myMinistryModel));
                          },
                          child: Container(
                              height: AppDimension.screenHeight(context) / 10,
                              width: AppDimension.screenWidth(context) / 3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                      colors: [Colors.cyan, Colors.blue])),
                              child: Center(
                                  child: Text(
                                "start_here".tr(),
                                style: AppTheme.headline3
                                    .copyWith(color: AppColors.white),
                              ))))*/
                    ].expand((element) => [element, SizedBox(height: 8)])
                  ]),
            ),
          ));
        });
  }
}
