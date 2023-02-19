import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';
import 'package:ministries_reception_app/core/widgets/default_scaffold.dart';
import 'package:ministries_reception_app/features/select_department_journy/presentation/widgets/main_elevated_button.dart';

import '../../../../core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../select_department_journy/data/my_ministriy_model.dart';
import '../../../select_department_journy/presentation/pages/welcome_page.dart';
import '../../../select_department_journy/presentation/widgets/logo_image.dart';
import '../../data/clients_requests_model.dart';
import '../../repository/clients_requests_repo.dart';
import '../widgets/one_client_request_card.dart';

class WaitingListPage extends StatelessWidget {
  final MyMinistryModel? ministryModel;
  final MyMinistryModel? myMinistryModel;

  WaitingListPage({Key? key,
    this.myMinistryModel,
    this.ministryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(logoUrl:myMinistryModel!.attachment!.url,
      body:
       Column(children: [

           Text("waiting_list".tr()),
           Container(height: AppDimension.screenHeight(context) / 2,
               child: _buildRequestList()),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:AppDimension.screenWidth(context)/3),
            child: MainElevatedButton(
                onTap: () {
                  Navigation.push(context, WelcomePage());
                },
                text: "create_new_client_request".tr()),
          )
        ])
      
    );
  }

  GetModelCubit? _getModelCubit;

  _buildRequestList() {
    return GetModel<ClientsRequestsModel>(
        repositoryCallBack: (data) => ClientsRequestsRepo.getClientsList(),
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
                    oneClientRequest: model.listClientsRequests![index],ministryModel:ministryModel);
              }),
              itemCount: model.listClientsRequests!.length);
        });
  }
}
