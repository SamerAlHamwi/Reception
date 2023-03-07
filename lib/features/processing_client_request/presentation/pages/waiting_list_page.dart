import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';
import 'package:ministries_reception_app/core/widgets/default_scaffold.dart';

import '../../../../core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '../../../../core/boilerplate/pagination/widgets/PaginationList.dart';
import '../../../select_unit_journy/data/my_ministriy_model.dart';
import '../../../select_unit_journy/presentation/pages/welcome_reception_page.dart';
import '../../../unit_screen/data/clients_requests_model.dart';
import '../../../unit_screen/repository/unit_screen_repository.dart';
import '../widgets/one_client_request_card.dart';

class WaitingListPage extends StatefulWidget {
  final MyMinistryModel? myMinistryModel;

  WaitingListPage({
    Key? key,
    this.myMinistryModel,
  }) : super(key: key);

  @override
  State<WaitingListPage> createState() => _WaitingListPageState();
  PaginationCubit? refresh;
}

class _WaitingListPageState extends State<WaitingListPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
         previousPage:WelcomeReceptionPage() ,
        logoUrl: widget.myMinistryModel!.attachment!.url,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Expanded(flex: 3,
                child: Align(alignment: Alignment.bottomCenter,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    Text("role_num".tr(),
                        style: AppTheme.bodyText1
                            .copyWith(color: AppColors.primaryColor)),
                    Text("unit_name".tr(),
                        style: AppTheme.bodyText1
                            .copyWith(color: AppColors.primaryColor)),
                    Text(
                        widget.myMinistryModel!.ministryRequestType == 1
                            ? "national_number".tr()
                            : "disability_number".tr(),
                        style: AppTheme.bodyText1
                            .copyWith(color: AppColors.primaryColor)),
                    Text("request_status".tr(),
                        style: AppTheme.bodyText1
                            .copyWith(color: AppColors.primaryColor)),
                  ]),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(flex: 7,
                  child: pagination()),
            ]));
  }

  Widget pagination() {
    return PaginationList<OneClientRequest>(
      onCubitCreated: (cubit) {
        widget.refresh = cubit;
      },
      repositoryCallBack: (data) => UnitScreenRepository.getClientsList(data,null),
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
            key: GlobalKey(),
            oneClientRequest: list![index],
            ministryModel: widget.myMinistryModel,
          );
        }),
        itemCount: list.length);
  }
}
