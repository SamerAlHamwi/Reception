import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_dimension.dart';
import 'package:ministries_reception_app/features/select_unit_journy/presentation/pages/departments_page.dart';
import 'package:ministries_reception_app/features/select_unit_journy/presentation/pages/units_page.dart';

import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/utils/shared_storage.dart';
import '../../../../core/widgets/default_scaffold_with_center_logo.dart';
import '../../../call_reception/presentation/pages/leaders_page.dart';
import '../../data/disability_category_model.dart';
import '../../data/my_ministriy_model.dart';
import '../../repository/ministriey_repo.dart';
import '../widgets/main_elevated_button.dart';

class DisabledCategoryPage extends StatelessWidget {
  final MyMinistryModel? myMinistryModel;

  const DisabledCategoryPage({Key? key, this.myMinistryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetModel<DisabilityCategoryModel>(
        repositoryCallBack: (data) => MinistrieyRepo.getDisabilityCatergory(),
        modelBuilder: (DisabilityCategoryModel disabilityCategoryModel) {
          return DefaultScaffoldWithCenterLogo(
            logoUrl: myMinistryModel!.attachment!.url!,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  // SizedBox(height: AppDimension.screenHeight(context) * 1 / 10),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.screenWidth(context) / 4),
                    height: AppDimension.screenHeight(context) * 5 / 10,
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 8,
                          );
                        },
                        itemCount:
                            disabilityCategoryModel.disabilityList!.length,
                        itemBuilder: (context, index) {
                          return MainElevatedButton(
                              text: disabilityCategoryModel
                                  .disabilityList!.reversed
                                  .toList()[index]
                                  .name,
                              onTap: () {
                                myMinistryModel!.departments!.length == 1
                                    ? SharedStorage.getUserType() == 1
                                        ? Navigation.push(
                                            context,
                                            UnitsPage(
                                                myMinistryModel:
                                                    myMinistryModel,
                                                disabilityCategoryId:
                                                    disabilityCategoryModel
                                                        .disabilityList!
                                                        .reversed
                                                        .toList()[index]
                                                        .id,
                                                selectedDepartmentId:
                                                    myMinistryModel!
                                                        .departments![0]
                                                        .id))
                                        : Navigation.push(
                                            context,
                                            LeadersPage(
                                              myMinistryModel: myMinistryModel,
                                              departmentId: myMinistryModel!
                                                  .departments![0].id,
                                            ))
                                    :
                                Navigation.push(
                                        context,
                                        DepartmentsPage(
                                            myMinistryModel: myMinistryModel,
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
            ),
          );
        });
  }
}
