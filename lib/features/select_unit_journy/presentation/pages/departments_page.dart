import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_theme.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';

import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_dimension.dart';
import '../../../../core/widgets/default_scaffold.dart';
import '../../data/my_ministriy_model.dart';
import '../../repository/ministriey_repo.dart';
import '../widgets/logo_image.dart';
import '../widgets/main_elevated_button.dart';
import 'units_page.dart';

class DepartmentsPage extends StatelessWidget {
  final MyMinistryModel? myMinistryModel;

  final int? disabilityCategoryId;

  const DepartmentsPage(
      {Key? key, this.myMinistryModel, this.disabilityCategoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultScaffold(
        logoUrl: myMinistryModel!.attachment!.url,
        body: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...[
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
                              itemCount: myMinistryModel!.departments!.length,
                            itemBuilder: (context, index) {
                              return MainElevatedButton(
                                  text: myMinistryModel!.departments![index].name,
                                  onTap: () {
                                    Navigation.push(
                                        context,
                                        UnitsPage(
                                            myMinistryModel: myMinistryModel,
                                            disabilityCategoryId:
                                                disabilityCategoryId,
                                            selectedDepartmentId: myMinistryModel!
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
  }
}
