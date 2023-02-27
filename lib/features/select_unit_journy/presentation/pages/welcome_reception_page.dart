import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/features/select_unit_journy/presentation/widgets/main_elevated_button.dart';

import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_dimension.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/frequently_used_function/frequenty_funtions.dart';
import '../../../../core/utils/navigation.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../../processing_client_request/presentation/pages/waiting_list_page.dart';
import '../../data/my_ministriy_model.dart';
import '../../repository/ministriey_repo.dart';
import '../widgets/center_logo.dart';
import 'disabled_gategory_page.dart';

class WelcomeReceptionPage extends StatelessWidget {
  const WelcomeReceptionPage({Key? key}) : super(key: key);

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
            child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: "logout",
                            child: ListTile(
                              leading: Icon(Icons.logout),
                              title: Text(
                                "logout".tr(),
                                style: AppTheme.bodyText1,
                              ),
                            ),
                          )
                        ];
                      },
                      onSelected: (String value) {
                        if (value == "logout") {
                          FrequentlyFunction.showLogoutConfirmDialog(
                              context, LoginPage());
                        }
                      },
                    ),
                  ),
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
                            style: AppTheme.headline3.copyWith(overflow: TextOverflow.ellipsis),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    AppDimension.screenWidth(context) / 4),
                            child: MainElevatedButton(
                              onTap: () {
                                Navigation.push(
                                    context,
                                    DisabledCategoryPage(
                                        myMinistryModel: myMinistryModel));
                              },
                              text: "create_new_request".tr(),
                            ),
                          )
                        ].expand((element) => [element, SizedBox(height: 8)]),
                      ]),
                  Container(padding: EdgeInsets.all(8),
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigation.push(
                            context,
                            WaitingListPage(
                                myMinistryModel:
                                myMinistryModel));
                      },
                      child:Text( "view_clients_requests".tr(),style: AppTheme.headline3.copyWith(color: AppColors.primaryColor),),
                    ),
                  ),
                ],
              ),

          ));
        });
  }
}
