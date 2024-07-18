import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';
import 'package:ministries_reception_app/core/widgets/default_scaffold.dart';

import '../../../../core/utils/navigation.dart';
import '../../../create_client_request/presentation/pages/national_number_page.dart';
import '../../data/my_ministriy_model.dart';
import '../widgets/main_elevated_button.dart';

class UnitsPage extends StatelessWidget {
  final MyMinistryModel? myMinistryModel;
  final int? selectedDepartmentId;
  final int? disabilityCategoryId;

  const UnitsPage(
      {Key? key,
      this.myMinistryModel,
      this.selectedDepartmentId,
      this.disabilityCategoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      logoUrl: myMinistryModel!.attachment!.url,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        ...[
          Expanded(flex: 2, child: Container()),
          Padding(padding:   EdgeInsets.symmetric(
          horizontal: AppDimension.screenWidth(context) * 2 / 8),
            child: MainElevatedButton(
                text: '${myMinistryModel!.departments!.firstWhere((element) => element.id == selectedDepartmentId).name}',
                onTap: () {},
                isDark: true),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Text(
              "select_desired".tr(),
                style: AppTheme.headline6.copyWith(
                  color: AppColors.black
                )
            ),
          ),
          Expanded(
            flex: 6,
            child: SingleChildScrollView(scrollDirection: Axis.vertical,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal, //default
                  spacing: 24,
                  runSpacing: 24,
                  children: [
                    ...myMinistryModel!.departments!
                        .firstWhere(
                            (element) => element.id == selectedDepartmentId)
                        .units!
                        .map((unit) {
                      return MainElevatedButton(
                          //isSquared: true,
                        height: 90,
                          width: AppDimension.screenWidth(context) / 3,
                          text: unit.name,
                          onTap: () {
                            Navigation.push(
                                context,
                                NationalNumberPage(
                                    myMinistryModel: myMinistryModel,
                                    selectedDepartmentId: selectedDepartmentId,
                                    disabilityCategoryId: disabilityCategoryId,
                                    selectedUnitId: unit.id,
                                    selectedUnitName: unit.name));
                          });
                    }).toList()
                  ]),
            ),
          )
        ]..expand((element) => [
              element,
              const SizedBox(
                height: 24,
              )
            ])
      ]),
    );
  }
}
