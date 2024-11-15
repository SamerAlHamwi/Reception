import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimension.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/widgets/logout_popup_menu_button.dart';
import '../../../select_unit_journy/data/my_ministriy_model.dart';
import '../../../select_unit_journy/presentation/pages/departments_page.dart';
import '../../../select_unit_journy/presentation/widgets/center_logo.dart';
import '../../../select_unit_journy/presentation/widgets/main_elevated_button.dart';
import '../../../select_unit_journy/repository/ministriey_repo.dart';
import 'call_list_page.dart';
import 'leaders_page.dart';

class WelcomeCallReceptionPage extends StatelessWidget {
  const WelcomeCallReceptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetModel<MyMinistryModel>(
        repositoryCallBack: (data) => MinistrieyRepo.getMyMinistries(),
        modelBuilder: (MyMinistryModel myMinistryModel) {
          return Scaffold(
              body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: LogoutPopupMenuButton()),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...[
                        CenterLogo(logoUrl: myMinistryModel.attachment!.url!),
                        Text(
                          myMinistryModel!.name ?? "",
                          style: AppTheme.headline3,
                        ),
                        Text(
                          myMinistryModel!.description ?? "",
                          style: AppTheme.headline3
                              .copyWith(overflow: TextOverflow.ellipsis),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  AppDimension.screenWidth(context) / 4),
                          child: Column(
                            children: [
                              MainElevatedButton(
                                onTap: () {
                                  myMinistryModel.departments != null &&
                                          myMinistryModel.departments!.length ==
                                              1
                                      ? Navigation.push(
                                          context,
                                          LeadersPage(
                                            myMinistryModel: myMinistryModel,
                                            departmentId: myMinistryModel!
                                                .departments![0].id,
                                          ))
                                      : Navigation.push(
                                          context,
                                          DepartmentsPage(
                                              myMinistryModel:
                                                  myMinistryModel));
                                },
                                text: "create_video_call_request".tr(),
                              ),
                              const SizedBox(height: 16),
                              MainElevatedButton(
                                onTap: () {
                                  Navigation.push(
                                      context,
                                      CallListPage(
                                        myMinistryModel: myMinistryModel!,
                                      ));
                                },
                                text: "view_video_call_requests".tr(),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.bottomLeft,
                                child: TextButton(
                                  onPressed: () {
                                    Navigation.push(
                                        context,
                                        CallListPage(
                                          myMinistryModel: myMinistryModel,
                                          isOld: true,
                                        ));
                                  },
                                  child: Text(
                                    "view_calls_history".tr(),
                                    style: AppTheme.headline3.copyWith(
                                        color: AppColors.primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ].expand((element) => [element, SizedBox(height: 8)]),
                    ]),
              ],
            ),
          ));
        });
  }
}
