import 'package:flutter/material.dart';
import '../../../../core/boilerplate/pagination/cubits/pagination_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ministries_reception_app/core/constants/app_assets.dart';
import 'package:ministries_reception_app/core/utils/shared_storage.dart';
import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/boilerplate/pagination/widgets/PaginationList.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/frequently_used_function/frequenty_funtions.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../../select_unit_journy/data/my_ministriy_model.dart';
import '../../../unit_screen/data/clients_requests_model.dart';
import '../../../unit_screen/data/configuration_model.dart';
import '../../../unit_screen/presentation/widgets/date_time_section.dart';
import '../../../unit_screen/presentation/widgets/one_visitor_card.dart';
import '../../../unit_screen/repository/unit_screen_repository.dart';

class MainUnitScreen extends StatefulWidget {
  const MainUnitScreen({Key? key}) : super(key: key);
  static PaginationCubit? refresh;
  static ScrollController _scrollController = ScrollController();

  static void updateVisitorList() {
    if (refresh != null) {
      refresh!.getList();
      _scrollController.animateTo(0,
          duration: Duration(seconds: 1), curve: Curves.linear);
    }
  }
  @override
  State<MainUnitScreen> createState() => _MainUnitScreenState();
}

class _MainUnitScreenState extends State<MainUnitScreen> {
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
          child: GetModel<MyMinistryModel>(
              repositoryCallBack: (data) =>
                  UnitScreenRepository.getMyMinistries(),
              modelBuilder: (MyMinistryModel myMinistriyModel) {
                return GetModel<ConfigurationModel>(
                    repositoryCallBack: (data) =>
                        UnitScreenRepository.getConfiguration(),
                    modelBuilder: (ConfigurationModel configurationModel) {
                      SharedStorage.writeSlaCompare(
                          configurationModel.slaCompare);
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
                                        style: AppTheme.unitHeadline.copyWith(
                                            overflow: TextOverflow.ellipsis)),
                                  ],
                                ),
                                AspectRatio(
                                  aspectRatio: 200 / 200,
                                  child: CustomImage.circular(
                                    image: myMinistriyModel!.attachment != null
                                        ? myMinistriyModel!.attachment!.url !=
                                        null
                                        ? myMinistriyModel!.attachment!.url
                                        : AppAssets.disabledLogo
                                        : AppAssets.disabledLogo,
                                    radius: 150,
                                    isNetworkImage:
                                    myMinistriyModel!.attachment != null
                                        ? myMinistriyModel!
                                        .attachment!.url !=
                                        null
                                        ? true
                                        : false
                                        : false,
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
                          Container(
                            height: sizes.maxHeight * 0.2 / 10,
                            /* child: Row(children: [
                            Text("disability type",style: AppTheme.bodyText1.copyWith(color: AppColors.primaryColor),)
                          ],),*/
                          ),
                          Container(
                            color: Colors.transparent,
                            height: sizes.maxHeight * 6 / 10,
                            child: pagination(myMinistriyModel.ministryRequestType??1),
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
                                                overflow:
                                                TextOverflow.ellipsis)),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  FrequentlyFunction
                                                      .showLogoutConfirmDialog(
                                                      context, LoginPage());
                                                },
                                                child: const Icon(
                                                  Icons.logout,
                                                  color:
                                                  AppColors.lightBlueColor,
                                                  size: 40,
                                                )),
                                          ],
                                        ))
                                  ])),
                        ]);
                      });
                    });
              })),
    );
  }
  Widget pagination(int ministryRequestType) {
    return PaginationList<OneClientRequest>(
      childEmptyWidget:Container() ,
      withPagination: true,
      onCubitCreated: (cubit) {
        MainUnitScreen.refresh = cubit;
      },
      repositoryCallBack: (data) =>
          UnitScreenRepository.getClientsList(data,1),
      listBuilder: (List<OneClientRequest> list) {
        return buildList(list,ministryRequestType);
      },
    );
  }

  buildList(List<OneClientRequest> list,int ministryRequestType) {
    return ListView.separated(
      controller: MainUnitScreen._scrollController,
      itemCount: list.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 8,
        );
      },
      itemBuilder: ((context, index) {
        return list![index].clientRequestType == 1
            ? OneVisitorCard(ministryRequestType:ministryRequestType,
          oneClientRequest: list![index],isMainUnit: true,
          key: GlobalKey(),
        )
            : Container();
      }),
    );
  }
}
