import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_theme.dart';

import '../../../../core/api/core_models/empty_model.dart';
import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/CreateModel.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../select_unit_journy/data/my_ministriy_model.dart';
import '../../data/call_model.dart';
import '../../data/notify_screen_model.dart';
import '../../repository/call_reception_repo.dart';
import 'call_actions_button.dart';

class CallCard extends StatelessWidget {
  final VoidCallback onTap;
  final MyMinistryModel? myMinistryModel;

  final Call call;

  CallCard(
      {Key? key, required this.onTap, required this.call, this.myMinistryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 220,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: call!.callStatus == 1
                ? AppColors.primarySwatch[100]
                : call!.callStatus == 2
                    ? AppColors.green
                    : AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              myMinistryModel!.departments!
                  .firstWhere(
                      (element) => element.id == call.leader!.departmentId)!
                  .name!,
              style: AppTheme.headline3,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("required_entity".tr() + " : ",style: AppTheme.bodyText1,),
                    Text(call.leader!.userPosition ?? "",style: AppTheme.bodyText1),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("leader_name".tr() + " : ",style: AppTheme.bodyText1),
                    Text(
                        call.leader!.name! + " " + call.leader!.surname! ?? "",style: AppTheme.bodyText1,),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Icon(Icons.date_range, color: AppColors.primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      "date".tr() + " : ",
                      style: AppTheme.headline3
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    Text(call.creationTime!.split("T")[0].toString(),
                        style:
                            AppTheme.headline3.copyWith(color: AppColors.offWhite,fontWeight: FontWeight.w700))
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_outlined,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Text("time".tr() + " : ",
                        style: AppTheme.headline3
                            .copyWith(color: AppColors.primaryColor)),
                    Text(
                        call.creationTime!
                            .split("T")[1]
                            .split(".")[0]
                            .toString(),
                        style: AppTheme.headline3.copyWith(
                            color: AppColors.offWhite,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              ],
            ),
            Text(call.id.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: call!.callStatus == 1
                  ? [_buildNotifiyScreenButton(), _builCancelButton()]
                  : call!.callStatus == 2
                      ? []
                      : [],
            )
          ],
        ),
      ),
    );
  }

  CreateModelCubit? notifyScreenCubit;
  CreateModelCubit? CancleCallRequestCubit;

  _buildNotifiyScreenButton() {
    return CreateModel<EmptyModel>(
        onSuccess: (EmptyModel model) {},
        repositoryCallBack: (data) => CallReceptionRepo.notifyScreeen(data),
        onCubitCreated: (CreateModelCubit cubit) {
          notifyScreenCubit = cubit;
        },
        child: CallActionsButton(
            buttonText: "start_call".tr(),
            buttonColor: AppColors.primaryColor,
            textColor: AppColors.white,
            onTap: () {
              notifyScreenCubit!.createModel(
                  NotifyScreenModel(id: call.id, screenId: call.screen!.id));
            }));
  }

  _builCancelButton() {
    return CreateModel<EmptyModel>(
        onSuccess: (EmptyModel model) {},
        repositoryCallBack: (data) => CallReceptionRepo.CancleCallRequest(data),
        onCubitCreated: (CreateModelCubit cubit) {
          CancleCallRequestCubit = cubit;
        },
        child: CallActionsButton(
            buttonText: "cancel".tr(),
            buttonColor: AppColors.lightBlueColor,
            textColor: AppColors.white,
            onTap: () {
              CancleCallRequestCubit!.createModel(call!.id!);
            }));
  }
}
