import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_dimension.dart';
import 'package:ministries_reception_app/core/utils/service_locator.dart';
import '../../../../core/boilerplate/pagination/widgets/PaginationList.dart';
import '../../../../core/widgets/default_scaffold.dart';
import '../../../select_unit_journy/data/my_ministriy_model.dart';
import '../../data/call_model.dart';
import '../../repository/call_reception_repo.dart';
import '../widgets/call_card.dart';
import 'package:get_it/get_it.dart';

class CallListPage extends StatelessWidget {
  final MyMinistryModel? myMinistryModel;
  final bool isOld;

  const CallListPage({Key? key, this.myMinistryModel, this.isOld = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        logoUrl: myMinistryModel!.attachment!.url,
        body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimension.screenWidth(context) * 1.5 / 10),
            height: AppDimension.screenHeight(context) * 7 / 10,
            child: pagination()));
  }

  Widget pagination() {
    return PaginationList<Call>(
      onCubitCreated: (cubit) {
        GetIt.I<CubitsStore>().callsList = cubit;
      },
      repositoryCallBack: (data) => CallReceptionRepo.getCalls(
        data: data,
        isOld: isOld,
      ),
      listBuilder: (List<Call> list) {
        return buildList(list);
      },
    );
  }

  buildList(List<Call> list) {
    bool hasActive = list.where((e) => e.callStatus == 4).toList().isNotEmpty;
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
        itemBuilder: ((context, index) {
          return CallCard(
            active: hasActive,
            key: GlobalKey(),
            call: list[index],
          );
        }),
        itemCount: list.length);
  }
}
