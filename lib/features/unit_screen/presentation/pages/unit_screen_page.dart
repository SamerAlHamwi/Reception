import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/widgets/custom_image.dart';

import '../../../../core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/utils/shared_storage.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../data/clients_requests_model.dart';
import '../../data/my_ministriy_model.dart';
import '../../repository/unit_screen_repository.dart';
import '../widgets/date_time_section.dart';
import '../widgets/dialog_exit_app.dart';
import '../widgets/one_visitor_card.dart';

class UnitScreenPage extends StatelessWidget {
  UnitScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            AppColors.lightBlueColor,
            AppColors.white,
            AppColors.white
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: GetModel<MyMinistriyModel>(
              repositoryCallBack: (data) => UnitScreenRepository.getMyMinistries(),
              modelBuilder: (MyMinistriyModel myMinistriyModel) {
                return LayoutBuilder(builder: (context, sizes) {
                  return Column(children: [
                    Container(
                      height: sizes.maxHeight * 2.3 / 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(height: 8),
                              Text(myMinistriyModel!.name ?? "",
                                  style: AppTheme.headline3.copyWith(
                                      overflow: TextOverflow.ellipsis)),
                              SizedBox(height: 8),
                              Text(
                                  myMinistriyModel.departments![0].name! +
                                      ":" +
                                      myMinistriyModel
                                          .departments![0].units![0].name!,
                                  style: AppTheme.headline3.copyWith(
                                      overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                          AspectRatio(
                            aspectRatio: 200 / 200,
                            child: CustomImage.circular(
                              image: myMinistriyModel!.attachment!.url,
                              radius: 150,
                              isNetworkImage: true,
                              fit: BoxFit.fill,
                              svg: false,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: sizes.maxHeight * 0.8 / 10,
                      child: DateTimeSection(),
                    ),
                    Container(height: sizes.maxHeight * 0.2 / 10),
                    Container(
                      color: Colors.transparent,
                      height: sizes.maxHeight * 6 / 10,
                      child: buildVisitorList(),
                    ),
                    Container(
                        height: sizes.maxHeight * 0.5 / 10,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 9,
                                child: Center(
                                  child: Text("copyright".tr(),
                                      style: AppTheme.bodyText2.copyWith(
                                          color: AppColors.grey,
                                          overflow: TextOverflow.ellipsis)),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            willPopCallback(context);
                                          },
                                          child: const Icon(
                                            Icons.logout,
                                            color: AppColors.lightBlueColor,
                                            size: 22,
                                          )),
                                    ],
                                  ))
                            ])),
                  ]);

                  ///});
                });
              })),
    );
  }

  GetModelCubit? _getModelCubit;

  buildVisitorList() {
    return GetModel<ClientsRequestsModel>(
        repositoryCallBack: (data) => UnitScreenRepository.getClientsList(),
        onSuccess: (ClientsRequestsModel model) {},
        onCubitCreated: (GetModelCubit? cubit) => _getModelCubit = cubit,
        modelBuilder: (ClientsRequestsModel model) {
          return ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemBuilder: ((context, index) {
                return OneVisitorCard(
                  oneClientRequest: model.listClientsRequests![index],
                );
              }),
              itemCount: model.listClientsRequests!.length);
        });
  }

  Future<bool> willPopCallback(context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return DialogExitApp(
            title: 'logout_confirmation'.tr(),
            content: 'are_you_sure_you_want_to_logout'.tr(),
            onPressedYes: () {
              SharedStorage.removeToken();
              Navigation.pushAndRemoveUntil(context, LoginPage());
            },
            onPressedNo: () {
              Navigator.pop(context, false);
            },
          );
        });
  }
}
