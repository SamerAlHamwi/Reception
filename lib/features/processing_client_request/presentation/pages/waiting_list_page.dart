import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';
import 'package:ministries_reception_app/core/widgets/default_scaffold.dart';

import '../../../../core/boilerplate/get_model/cubits/get_model_cubit.dart';
import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '../../../../core/boilerplate/pagination/widgets/PaginationList.dart';
import '../../../select_unit_journy/data/my_ministriy_model.dart';
import '../../../select_unit_journy/presentation/pages/welcome_page.dart';
import '../../../select_unit_journy/presentation/widgets/main_elevated_button.dart';
import '../../../unit_screen/data/clients_requests_model.dart';
import '../../../unit_screen/repository/unit_screen_repository.dart';
import '../widgets/one_client_request_card.dart';

class WaitingListPage extends StatelessWidget {
  final MyMinistryModel? myMinistryModel;

  WaitingListPage({
    Key? key,
    this.myMinistryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        logoUrl: myMinistryModel!.attachment!.url,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("waiting_list".tr(),
                  style: AppTheme.bodyText1
                      .copyWith(color: AppColors.primaryColor)),
              SizedBox(height: 8),
              Container(
                  height: AppDimension.screenHeight(context) * 4 / 10,
                  child: pagination()),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimension.screenWidth(context) / 3),
                child: MainElevatedButton(
                    onTap: () {
                      Navigation.push(context, WelcomePage());
                    },
                    text: "create_new_client_request".tr()),
              )
            ]));
  }

  static PaginationCubit? refresh;

  Widget pagination() {
    return PaginationList<OneClientRequest>(
      onCubitCreated: (cubit) {
        refresh = cubit;
      },
      repositoryCallBack: (data) => UnitScreenRepository.getClientsList(data),
      listBuilder: (List<OneClientRequest> list) {
        return buildList(list);
      },
    );
  }

  buildList(List<OneClientRequest> list) {

    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
        itemBuilder: ((context, index) {
          return OneVisitorCardForReception(
            oneClientRequest: list![index],
            ministryModel: myMinistryModel,
          );
        }),
        itemCount: list.length);

  }



}
