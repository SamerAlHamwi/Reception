import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_dimension.dart';

import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../features/select_department_journy/presentation/pages/sections_page.dart';
import '../../data/disability_category_model.dart';
import '../../data/my_ministriy_model.dart';
import '../../repository/ministriey_repo.dart';
import '../widgets/logo_image.dart';
import '../widgets/main_elevated_button.dart';

class DisabledCategoryPage extends StatelessWidget {
  final MyMinistryModel? myMinistryModel;

  const DisabledCategoryPage({Key? key,this.myMinistryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetModel<DisabilityCategoryModel>(
        repositoryCallBack: (data) => MinistrieyRepo.getDisabilityCatergory(),
        modelBuilder: (DisabilityCategoryModel disabilityCategoryModel) {
          return Scaffold(
              body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension.screenWidth(context) / 4),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: AppDimension.screenHeight(context) * 1 / 10),
                SizedBox(
                  height: AppDimension.screenHeight(context) * 3 / 10,
                  child: LogoImage(imageUrl:myMinistryModel!.attachment!.url!),

                ),
               const SizedBox(height: 8),
               // SizedBox(height: AppDimension.screenHeight(context) * 1 / 10),
                SizedBox(
                  height: AppDimension.screenHeight(context) * 5 / 10,
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: disabilityCategoryModel.disabilityList!.length,
                      itemBuilder: (context, index) {
                        return MainElevatedButton(
                            text: disabilityCategoryModel
                                .disabilityList!.reversed
                                .toList()[index]
                                .name,
                            onTap: () {
                              Navigation.push(
                                  context,
                                  SectionsPage(myMinistryModel:myMinistryModel,
                                      disabilityCategoryId:
                                          disabilityCategoryModel
                                              .disabilityList!.reversed
                                              .toList()[index]
                                              .id));
                            });
                      }),
                ),
              ],
            ),
          ));
        });
  }
}
