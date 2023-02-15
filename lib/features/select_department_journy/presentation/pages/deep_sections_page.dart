import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';
import 'package:ministries_reception_app/features/select_department_journy/data/my_ministriy_model.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/navigation.dart';
import '../../../booking_waiting_role/presentation/pages/national_number_page.dart';
import '../widgets/logo_image.dart';
import '../widgets/main_elevated_button.dart';

class DeepSectionsPage extends StatelessWidget {
  MyMinistriyModel? ministriyModel;
  final int? selectedDepartmentId;
  final int? disabilityCategoryId;

  DeepSectionsPage({Key? key, this.ministriyModel, this.selectedDepartmentId,this.disabilityCategoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child: LayoutBuilder(builder: (context, sizes) {
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal:sizes.maxWidth*2/10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...[
                        Container(
                          height: sizes.maxHeight / 10,
                          child: Row(
                            children: [
                              LogoImage(
                                radius: 100,
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                        ),
                        Container(
                            height: sizes.maxHeight * 0.5 / 10,
                            child:
                            Text("select_desired".tr(),style: AppTheme.bodyText1,),
                        ),
                        Container(
                          height: sizes.maxHeight * 1 / 10,
                          child: MainElevatedButton(
                              text: ministriyModel!.departments!
                                  .firstWhere((element) =>
                                      element.id == selectedDepartmentId)!
                                  .name,
                              onTap: () {},
                            isDark:true
                          ),
                        ),
                        Container(
                          height: AppDimension.screenHeight(context) * 5 / 10,
                          padding:  EdgeInsets.symmetric(horizontal:sizes.maxWidth/10),

                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 8,
                                );
                              },
                              itemCount: ministriyModel!.departments!
                                  .firstWhere((element) =>
                                      element.id == selectedDepartmentId)!
                                  .units!
                                  .length,
                              itemBuilder: (context, index) {
                                return MainElevatedButton(//isSquared: true,
                                    text: ministriyModel!.departments!
                                        .firstWhere((element) =>
                                            element.id == selectedDepartmentId)!
                                        .units![index]
                                        .name,
                                    onTap: () {
                                      Navigation.push(
                                          context,
                                          NationalNumberPage(
                                              ministriyModel: ministriyModel,
                                              selectedDepartmentId:
                                                  selectedDepartmentId,
                                              disabilityCategoryId:
                                              disabilityCategoryId,
                                              selectedUintId: ministriyModel!
                                                  .departments!
                                                  .firstWhere((element) =>
                                                      element.id ==
                                                      selectedDepartmentId)!
                                                  .units![index]
                                                  .id));
                                    });
                              }),
                        )
                      ]..expand((element) => [
                            element,
                            SizedBox(
                              height: 24,
                            )
                          ])
                    ]),
              );
            })));
  }
}
