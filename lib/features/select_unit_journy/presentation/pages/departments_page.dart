import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_theme.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';
import 'package:ministries_reception_app/core/utils/shared_storage.dart';

import '../../../../core/constants/app_dimension.dart';
import '../../../../core/widgets/default_scaffold.dart';
import '../../../call_reception/presentation/pages/leaders_page.dart';
import '../../data/my_ministriy_model.dart';
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
    return DefaultScaffold(
        logoUrl: myMinistryModel!.attachment!.url,
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container()
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "select_desired".tr(),
                      style: AppTheme.bodyText1,
                    ),
                  ),
                ),
                myMinistryModel!.departments!=null?
                Expanded(flex: 6,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimension.screenWidth(context) / 4),

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
                                      if (SharedStorage.getUserType() == 1) {
                                        Navigation.push(
                                            context,
                                            UnitsPage(
                                                myMinistryModel: myMinistryModel,
                                                disabilityCategoryId:
                                                    disabilityCategoryId,
                                                selectedDepartmentId:
                                                    myMinistryModel!
                                                        .departments![index].id));
                                      } else {
                                        Navigation.push(
                                            context,
                                            LeadersPage(
                                              myMinistryModel: myMinistryModel,
                                              departmentId: myMinistryModel!
                                                  .departments![index].id,
                                            ));
                                      }
                                    });
                              }),
                        ),
                  ):Container()

              ],
            ),
          ),
        ));
  }
}
