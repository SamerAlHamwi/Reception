import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_theme.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';

import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_dimension.dart';
import '../../../../features/select_department_journy/presentation/pages/deep_sections_page.dart';
import '../../data/my_ministriy_model.dart';
import '../../repository/ministriey_repo.dart';
import '../widgets/logo_image.dart';
import '../widgets/main_elevated_button.dart';

class SectionsPage extends StatelessWidget {
  final MyMinistryModel? myMinistryModel;

  final int? disabilityCategoryId;

  const SectionsPage(
      {Key? key, this.myMinistryModel, this.disabilityCategoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetModel<MyMinistryModel>(
        repositoryCallBack: (data) =>
            MinistrieyRepo.getMinistriesById(myMinistryModel!.id!),
        modelBuilder: (MyMinistryModel ministriyModel) {
          return Scaffold(
              body: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...[
                   Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        LogoImage(imageUrl: myMinistryModel!.attachment!.url!)
                      ],

                  ),
                  Text(
                    "select_desired".tr(),
                    style: AppTheme.bodyText1,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppDimension.screenWidth(context) / 4),
                      child: SizedBox(
                        height: AppDimension.screenHeight(context) * 5 / 10,
                        child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 8,
                              );
                            },
                            itemCount: ministriyModel.departments!.length,
                            itemBuilder: (context, index) {
                              return MainElevatedButton(
                                  text: ministriyModel.departments![index].name,
                                  onTap: () {
                                    Navigation.push(
                                        context,
                                        DeepSelectionPage(
                                            myMinistryModel: myMinistryModel,
                                            ministryModel: ministriyModel,
                                            disabilityCategoryId:
                                                disabilityCategoryId,
                                            selectedDepartmentId: ministriyModel
                                                .departments![index].id));
                                  });
                            }),
                      ))
                ].expand((element) => [
                      element,
                      const SizedBox(
                        height: 8,
                      )
                    ])
              ],
            ),
          ));
        });
  }
}
