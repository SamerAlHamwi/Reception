import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_theme.dart';

import '../../../../core/api/core_models/empty_model.dart';
import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/CreateModel.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/call_model.dart';
import '../../data/notify_screen_model.dart';
import '../../repository/call_reception_repo.dart';
import 'call_actions_button.dart';

class CallCard extends StatelessWidget {
  final VoidCallback onTap;
  final Call call;

  CallCard({Key? key, required this.onTap, required this.call})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.date_range),
                    Text(
                      "date".tr() +
                          " : " +
                          call.creationTime!.split("T")[0].toString(),
                      style: AppTheme.headline3.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time_outlined),
                    Text(
                        "time".tr() +
                            " : " +
                            call.creationTime!
                                .split("T")[1]
                                .split(".")[0]
                                .toString(),
                        style: AppTheme.headline3.copyWith(color: AppColors.white)),
                  ],
                ),
              ],
            ),
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
            buttonColor: AppColors.primaryColor,
            textColor: AppColors.white,
            onTap: () {
              CancleCallRequestCubit!.createModel(call!.id!);
            }));
  }
}
