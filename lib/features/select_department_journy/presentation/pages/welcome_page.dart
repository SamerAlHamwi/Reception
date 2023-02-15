import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_dimension.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../features/select_department_journy/presentation/pages/disabled_gategory_page.dart';
import '../../data/my_ministriy_model.dart';
import '../../repository/ministriey_repo.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetModel<MyMinistriyModel>(
        repositoryCallBack: (data) => MinistrieyRepo.getMyMinistries(),
        modelBuilder: (MyMinistriyModel myMinistriyModel) {
          return Scaffold(
              body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child: Container(
              height: AppDimension.screenHeight(context) * 9 / 10,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...[
                      Container(
                        alignment: Alignment.center,
                        height: AppDimension.screenHeight(context) * 3 / 10,
                        child: CustomImage.circular(
                          image: myMinistriyModel.attachment!.url!,
                          radius: 200,
                          isNetworkImage: true,
                          svg: false,
                        ),
                      ),
                      Text(
                        myMinistriyModel!.name ?? "",
                        style: AppTheme.headline3,
                      ),
                      Text(
                        myMinistriyModel!.description ?? "",
                        style: AppTheme.headline3,
                      ),
                      InkWell(
                          onTap: () {
                            Navigation.push(context, DisabledGategoryPage(ministryId:myMinistriyModel.id));
                          },
                          child: Container(
                              height: AppDimension.screenHeight(context) / 10,
                              width: AppDimension.screenWidth(context) / 3,
                              child: Center(
                                  child: Text(
                                "start_here".tr(),
                                style: AppTheme.headline3
                                    .copyWith(color: AppColors.white),
                              )),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [Colors.cyan, Colors.blue]))))
                    ].expand((element) => [element, SizedBox(height: 8)])
                  ]),
            ),
          ));
        });
  }
}
