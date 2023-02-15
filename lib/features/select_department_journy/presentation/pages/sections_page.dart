import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_theme.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';
import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/constants/app_dimension.dart';
import '../../../../features/select_department_journy/presentation/pages/deep_sections_page.dart';

import '../../../../core/constants/app_assets.dart';
import '../../data/my_ministriy_model.dart';
import '../../repository/ministriey_repo.dart';
import '../widgets/logo_image.dart';
import '../widgets/main_elevated_button.dart';

class SectionsPage extends StatelessWidget {
  final int? ministryId;

  final int? disabilityCategoryId;
   SectionsPage({Key? key,this.ministryId,this.disabilityCategoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetModel<MyMinistriyModel>(
        repositoryCallBack: (data) => MinistrieyRepo.getMinistriesById(ministryId!),
    modelBuilder: (MyMinistriyModel ministriyModel) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...[
            Row(
              children: [
                LogoImage(
                  radius: 100,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            Text("select_desired".tr(),style: AppTheme.bodyText1,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimension.screenWidth(context)/4),

              child:
              Container(
                height: AppDimension.screenHeight(context) * 5 / 10,
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 8,
                      );
                    },
                    itemCount: ministriyModel.departments!.length,
                    itemBuilder: (context, index) {
                      return MainElevatedButton(
                          text: ministriyModel.departments![index]
                              .name,
                          onTap: () {
                            Navigation.push(context, DeepSectionsPage(ministriyModel:ministriyModel,disabilityCategoryId:disabilityCategoryId,selectedDepartmentId:ministriyModel.departments![index].id));
                          });
                    }),
              )


              /*Column(children: [...[
                MainElevatedButton(text: "شؤون رعاية القصر", onTap: () {}),
                MainElevatedButton(text: "شؤون تنمية أموال القصر", onTap: () {}),
                MainElevatedButton(
                    text: "الشؤون الإدارية والمالية والتطوير الإداري",
                    onTap: () {
                      Navigation.push(context,DeepSectionsPage());
                    }),
                MainElevatedButton(
                    text: "الشؤون القانونية والأثلاث الخيرية", onTap: () {}),
              ].expand((element) => [element,SizedBox(height: 16)])],),*/
            )

          ].expand((element) => [
                element,
                SizedBox(
                  height: 24,
                )
              ])
        ],
      ),
    ));});
  }
}
