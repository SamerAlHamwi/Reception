import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_theme.dart';
import 'package:ministries_reception_app/core/utils/service_locator.dart';

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
  final Call call;
  final bool active;

  CreateModelCubit? deleteCubit;

  CallCard({
    super.key,
    this.active = true,
    required this.call,
  });

  @override
  Widget build(BuildContext context) {
    return _buildCallCard(
      context,
    );
  }

  Widget _buildCallCard(context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date and time
            Row(
              children: [
                SizedBox(width: 2,),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _getStatusColor(_getStatus(call.callStatus!))),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "${call.orderNumber}",
                  style: AppTheme.headline3,
                ),
                // CancelCallPopUp(callId: call.id)
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                const Icon(Icons.date_range, color: AppColors.primaryColor),
                const SizedBox(width: 8),
                Text(
                  "${"date".tr()} : ",
                  style: AppTheme.bodyText2
                      .copyWith(color: AppColors.primaryColor),
                ),
                Text(call.creationTime!.split("T")[0].toString(),
                    style: AppTheme.bodyText2)
              ],
            ),
            SizedBox(height: 4,),
            Row(
              children: [
                const Icon(
                  Icons.access_time_outlined,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(width: 8),
                Text("${"time".tr()} : ",
                    style: AppTheme.bodyText2
                        .copyWith(color: AppColors.primaryColor)),
                Text(
                    DateTime.tryParse('${call.creationTime!}Z')!
                        .toLocal()
                        .toString()
                        .split('.')[0]
                        .toString()
                        .split(" ")[1]
                        .toString(),
                    style: AppTheme.bodyText2)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            _getButtons(),
          ],
        ));
  }

  String getDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  _getStatusColor(String status) {
    if (status == "Waiting".tr()) {
      return Colors.yellow;
    } else if (status == "Treated".tr()) {
      return Colors.green;
    } else if (status == "Canceled".tr()) {
      return Colors.redAccent;
    } else if (status == "Active".tr()) {
      return Colors.green;
    }
  }

  String _getStatus(int status) {
    if (status == 1) {
      return "Waiting".tr();
    } else if (status == 2) {
      return "Treated".tr();
    } else if (status == 3) {
      return "Canceled".tr();
    } else if (status == 4) {
      return "Active".tr();
    }
    return "Active".tr();
  }

  /* CreateModelCubit? CancleCallRequestCubit;

  _buildCancelButton() {
    return CreateModel<EmptyModel>(
        onSuccess: (EmptyModel model) {},
        repositoryCallBack: (data) => CallReceptionRepo.CancleCallRequest(data),
        onCubitCreated: (CreateModelCubit cubit) {
          CancleCallRequestCubit = cubit;
        },
        child: CallActionsButton(
            buttonText: "cancel".tr(),
            buttonColor: Colors.red[400],
            textColor: AppColors.white,
            onTap: () {
              CancleCallRequestCubit!.createModel(call!.id!).then((value) {
                HomeApp.updateWaitingCallList();
              });
            }));
  }*/

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNotifyScreenToJoinButton(),
        _buildCancelButton(),
        _buildNotifyScreenToLeaveButton(),
      ],
    );
  }

  CreateModelCubit? notifyScreenToLeaveCubit;
  CreateModelCubit? notifyScreenToJoinCubit;
  CreateModelCubit? cancelCallRequestCubit;

  _buildNotifyScreenToJoinButton() {
    return CreateModel<EmptyModel>(
        onSuccess: (EmptyModel model) {},
        repositoryCallBack: (data) =>
            CallReceptionRepo.notifyScreenToJoin(data),
        onCubitCreated: (CreateModelCubit cubit) {
          notifyScreenToJoinCubit = cubit;
        },
        child: CallActionsButton(
            buttonText: "start_call".tr(),
            buttonColor: call.callStatus == 4 || active
                ? AppColors.grey
                : AppColors.green,
            textColor: AppColors.white,
            onTap: call.callStatus == 4 || active
                ? null
                : () {
                    notifyScreenToJoinCubit!.createModel(NotifyScreenModel(
                        id: call.id, screenId: call.screen!.id));
                  }));
  }

  _buildNotifyScreenToLeaveButton() {
    return CreateModel<EmptyModel>(
        onSuccess: (EmptyModel model) {},
        repositoryCallBack: (data) =>
            CallReceptionRepo.notifyScreenToLeave(data),
        onCubitCreated: (CreateModelCubit cubit) {
          notifyScreenToLeaveCubit = cubit;
        },
        child: CallActionsButton(
            buttonText: "end_call".tr(),
            buttonColor: call.callStatus == 4 ? AppColors.red : AppColors.grey,
            textColor: AppColors.white,
            onTap: call.callStatus == 4
                ? () {
                    notifyScreenToLeaveCubit!.createModel(NotifyScreenModel(
                        id: call.id, screenId: call.screen!.id));
                  }
                : null));
  }

  _buildCancelButton() {
    return CreateModel<EmptyModel>(
        onSuccess: (EmptyModel model) {
          ServiceLocator.refreshCalls();
        },
        repositoryCallBack: (data) => CallReceptionRepo.cancelCallRequest(data),
        onCubitCreated: (CreateModelCubit cubit) {
          cancelCallRequestCubit = cubit;
        },
        child: CallActionsButton(
            buttonText: "cancel".tr(),
            buttonColor: call.callStatus == 4
                ? AppColors.grey
                : AppColors.lightBlueColor,
            textColor: AppColors.white,
            onTap: call.callStatus == 4
                ? null
                : () {
                    cancelCallRequestCubit!.createModel(call.id!);
                  }));
  }
}
