import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_dimension.dart';
import '../../../../core/boilerplate/pagination/cubits/pagination_cubit.dart';
import '../../../../core/boilerplate/pagination/widgets/PaginationList.dart';
import '../../../../core/widgets/default_scaffold.dart';
import '../../../select_unit_journy/data/my_ministriy_model.dart';
import '../../data/call_model.dart';
import '../../repository/call_reception_repo.dart';
import '../widgets/call_card.dart';

class CallListPage extends StatelessWidget {
  final MyMinistryModel? myMinistryModel;

  CallListPage({Key? key, this.myMinistryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        logoUrl: myMinistryModel!.attachment!.url,
        body: Container(
          height: AppDimension.screenHeight(context)*7/10,
          child: pagination()

        ));
  }

  PaginationCubit? refresh;

  Widget pagination() {
    return PaginationList<Call>(
      onCubitCreated: (cubit) {
        refresh = cubit;
      },
      repositoryCallBack: (data) => CallReceptionRepo.getCalls(data),
      listBuilder: (List<Call> list) {
        return buildList(list);
      },
    );
  }

  buildList(List<Call> list) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
        itemBuilder: ((context, index) {
          return CallCard(
            key: GlobalKey(),
            call: list[index],
              myMinistryModel:myMinistryModel,
            onTap: () {},
          );
        }),
        itemCount: list.length);
  }
}
