import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';
import 'package:ministries_reception_app/core/widgets/default_scaffold.dart';
import 'package:ministries_reception_app/features/select_department_journy/data/my_ministriy_model.dart';

import '../../../../core/utils/navigation.dart';
import '../../../booking_waiting_role/presentation/pages/national_number_page.dart';
import '../widgets/main_elevated_button.dart';

class DeepSelectionPage extends StatelessWidget {
  final MyMinistryModel? myMinistryModel;
  final MyMinistryModel? ministryModel;
  final int? selectedDepartmentId;
  final int? disabilityCategoryId;

  const DeepSelectionPage(
      {Key? key,
      this.ministryModel,
      this.myMinistryModel,
      this.selectedDepartmentId,
      this.disabilityCategoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      logoUrl: myMinistryModel!.attachment!.url,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimension.screenWidth(context) * 2 / 10),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ...[
            SizedBox(
              height: AppDimension.screenHeight(context) * 0.5 / 10,
              child: Text(
                "select_desired".tr(),
                style: AppTheme.bodyText1,
              ),
            ),
            SizedBox(
              height: AppDimension.screenHeight(context) * 1 / 10,
              child: MainElevatedButton(
                  text: ministryModel!.departments!
                      .firstWhere(
                          (element) => element.id == selectedDepartmentId)!
                      .name,
                  onTap: () {},
                  isDark: true),
            ),
            Container(
              height: AppDimension.screenHeight(context) * 5 / 10,
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimension.screenWidth(context) / 10,vertical: 8),
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                  itemCount: ministryModel!.departments!
                      .firstWhere(
                          (element) => element.id == selectedDepartmentId)!
                      .units!
                      .length,
                  itemBuilder: (context, index) {
                    return MainElevatedButton(
                        //isSquared: true,
                        text: ministryModel!.departments!
                            .firstWhere((element) =>
                                element.id == selectedDepartmentId)!
                            .units![index]
                            .name,
                        onTap: () {
                          Navigation.push(
                              context,
                              NationalNumberPage(
                                  ministryModel: ministryModel,
                                  myMinistryModel: myMinistryModel,
                                  selectedDepartmentId: selectedDepartmentId,
                                  disabilityCategoryId: disabilityCategoryId,
                                  selectedUnitId: ministryModel!.departments!
                                      .firstWhere((element) =>
                                          element.id == selectedDepartmentId)!
                                      .units![index]
                                      .id,
                              selectedUnitName:ministryModel!.departments!
                                  .firstWhere((element) =>
                              element.id == selectedDepartmentId)!
                                  .units![index]
                                  .name)
                          );
                        });
                  }),
            )
          ]..expand((element) => [
                element,
                const SizedBox(
                  height: 24,
                )
              ])
        ]),
      ),
    );
  }
}
