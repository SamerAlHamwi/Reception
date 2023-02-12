import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../data/clients_requests_model.dart';
import '../../data/date_model.dart';
import '../../data/time_model.dart';
import '../../repository/home_repository.dart';
import '../widgets/date_row.dart';
import '../widgets/one_visitor_card.dart';
import '../widgets/time_row.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        decoration:const BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColors.lightBlueColor,
          AppColors.white,
          AppColors.white
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: LayoutBuilder(builder: (context, sizes) {
          return Column(children: [
            Container(
              height: sizes.maxHeight * 3 / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("الخدمات المتكاملة لذوي الاحتياجات الخاصة",
                            style: AppTheme.headline3),
                        SizedBox(height: 8),
                        Text(
                            "الشؤون الإدارية والمالية والتطوير الإداري :إدارة الشؤون الإدارية",
                            style: AppTheme.headline3),
                      ],
                    ),
                  ),
                  CustomImage.circular(
                    image: AppAssets.appLogoURI,
                    radius: 200,
                    isNetworkImage: false,
                    svg: false,
                  ),
                ],
              ),
            ),
            Container(
              height: sizes.maxHeight * 0.8 / 10,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("date".tr()+": ", style: AppTheme.headline3),
                DateRow(
                  dateModel: DateModel(day: "28", month: "Nov", year: "22"),
                ),
                SizedBox(width: 32),
                Text("time".tr()+":", style: AppTheme.headline3),
                TimeRow(timeModel: TimeModel(hour: "02", minutes: "00"))
              ]),
            ),
            Container(height: sizes.maxHeight * 0.2 / 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              color: Colors.transparent,
              height: sizes.maxHeight * 4.8 / 10,
              child: buildVisitorList(),
            ),
            Container(
              height: sizes.maxHeight * 0.8 / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Navigation.push(context, LoginPage());
                      },
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient:const LinearGradient(
                                  colors: [
                                    AppColors.lightBlueColor,
                                    AppColors.blueColor,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: AppColors.white,
                            size: 25,
                          )))
                ],
              ),
            ),
            Container(
              height: sizes.maxHeight * 0.4 / 10,
              child: Text(
                  "جميع الحقوق محفوظة 2022@ الخدمات المتكاملة لذوي الاحتياجات الخاصة",
                  style: AppTheme.bodyText2.copyWith(color: AppColors.grey)),
            )
          ]);
        }),
      ),
    );
  }
  GetModelCubit? _getModelCubit;
  buildVisitorList() {
    OneClientRequest oneClientRequest = OneClientRequest(
        id: 0,
        clientNationalNumberOrDisabilityNumber: "0876543345",
        clientRequestType: 1,
        employeetreatNumber: "O-0015",
        treatTime: "2023-02-12T12:30:50.889Z",
        unitId: 1);
    return GetModel<ClientsRequestsModel>(
        repositoryCallBack: (data) => HomeRepository.getClientsList(),
    onSuccess: (ClientsRequestsModel model) {},
    onCubitCreated: (GetModelCubit? cubit) => _getModelCubit = cubit,
    modelBuilder: (ClientsRequestsModel model) {
          model.listClientsRequests!.add(oneClientRequest);
    return ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 8,
          );
        },
        itemBuilder: ((context, index) {
          return OneVisitorCard(oneClientRequest: model.listClientsRequests![index],);
        }),
        itemCount: model.listClientsRequests!.length);});
  }
}
