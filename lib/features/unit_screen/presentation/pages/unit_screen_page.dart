import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/utils/shared_storage.dart';

import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '../../../../core/boilerplate/pagination/widgets/PaginationList.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/frequently_used_function/frequenty_funtions.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../data/clients_requests_model.dart';
import '../../data/configuration_model.dart';
import '../../data/my_ministriy_model.dart';
import '../../repository/unit_screen_repository.dart';
import '../widgets/date_time_section.dart';
import '../widgets/one_visitor_card.dart';

class UnitScreenPage extends StatefulWidget {
  UnitScreenPage({Key? key}) : super(key: key);

  @override
  State<UnitScreenPage> createState() => _UnitScreenPageState();

  static PaginationCubit? refresh;

  static void updateVisitorList() {
    if (refresh != null) {
      refresh!.getList();
    }
  }
}

class _UnitScreenPageState extends State<UnitScreenPage> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        UnitScreenPage.refresh!.getList(loadMore: true);
      }
    });
  }

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
              repositoryCallBack: (data) =>
                  UnitScreenRepository.getMyMinistries(),
              modelBuilder: (MyMinistriyModel myMinistriyModel) {
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
                                        style: AppTheme.headline3.copyWith(
                                            overflow: TextOverflow.ellipsis)),
                                    SizedBox(height: 8),
                                    Text(
                                        myMinistriyModel.departments![0].name! +
                                            ":" +
                                            myMinistriyModel.departments![0]
                                                .units![0].name!,
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
                          Container(height: sizes.maxHeight * 0.2 / 10,
                         /* child: Row(children: [
                            Text("نوع الإعاقة",style: AppTheme.bodyText1.copyWith(color: AppColors.primaryColor),)
                          ],),*/
                          ),
                          Container(
                            color: Colors.transparent,
                            height: sizes.maxHeight * 6 / 10,
                            child: pagination(),
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
                                                  size: 22,
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

  Widget pagination() {
    return PaginationList<OneClientRequest>(
      onCubitCreated: (cubit) {
        UnitScreenPage.refresh = cubit;
      },
      repositoryCallBack: (data) => UnitScreenRepository.getClientsList(data),
      listBuilder: (List<OneClientRequest> list) {
        return buildList(list);
      },
    );
  }

  buildList(List<OneClientRequest> list) {
    return ListView.separated(
      controller: _scrollController,
      itemCount: list.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 8,
        );
      },
      itemBuilder: ((context, index) {
        return list![index].clientRequestType == 1
            ? OneVisitorCard(
                oneClientRequest: list![index],
              )
            : Container();
      }),
    );
  }
}
