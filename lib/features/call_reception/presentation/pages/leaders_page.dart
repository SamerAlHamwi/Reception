import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_dimension.dart';
import 'package:ministries_reception_app/core/constants/app_theme.dart';
import 'package:ministries_reception_app/features/call_reception/presentation/pages/welcome_call_reception_page.dart';
import 'package:ministries_reception_app/features/select_unit_journy/presentation/pages/welcome_reception_page.dart';

import '../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../core/boilerplate/create_model/widgets/CreateModel.dart';
import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/widgets/default_scaffold.dart';
import '../../../select_unit_journy/data/my_ministriy_model.dart';
import '../../data/create_call_request.dart';
import '../../repository/call_reception_repo.dart';
import '../widgets/leaders_card.dart';

class LeadersPage extends StatelessWidget {
  final MyMinistryModel? myMinistryModel;
  final int? departmentId;

   LeadersPage({Key? key, this.myMinistryModel, this.departmentId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetModel<Departments>(
        repositoryCallBack: (data) =>
            CallReceptionRepo.getDepartmentById(departmentId!),
        modelBuilder: (Departments department) {
          return DefaultScaffold(
            logoUrl: myMinistryModel!.attachment!.url,
            body: Column(
              children: [
                SizedBox(
                    height: AppDimension.screenHeight(context) * 1 / 10,
                    child: Text(
                      "select_desired".tr(),
                      style: AppTheme.bodyText1,
                    )),
                Container(
                  height: AppDimension.screenHeight(context) * 6 / 10,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 48),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                        direction: Axis.horizontal, //default
                        spacing: 24,
                        runSpacing: 24,
                        children: department!.employees != null
                            ? [
                                ...department!.employees!
                                    .map((Employees employee) => LeadersCard(
                                       leaderDetails:employee,
                                          onTap: () {
                                            _showConfirmDialog(context,employee.id);
                                          },
                                        ))
                                    .toList()
                              ]
                            : []),
                  ),
                ),
              ],
            ),
          );
        });
  }

  CreateModelCubit? cubit;

  _showConfirmDialog(context,leaderId) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: Text('are_you_sure'.tr()),
            actions:  <Widget>[Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 8,
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.shade600,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: TextButton(
                        onPressed: (){Navigation.pop(context);},
                        child:Text('no'.tr(), style: AppTheme.bodyText2.copyWith(color: AppColors.white))),
                  ),
                 const SizedBox(width: 8),
                  CreateModel(
                    repositoryCallBack: (data) =>
                        CallReceptionRepo.createCards(data),
                    onCubitCreated: (CreateModelCubit c) {
                      cubit = c!;
                    },
                    onSuccess: (model) {
                      Navigator.pop(context);
                      Navigation.push(context, WelcomeCallReceptionPage());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 8,
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.lightBlueColor,
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      child: TextButton(
                          child: Text('yes'.tr(),
                              style: AppTheme.bodyText1
                                  .copyWith(color: Colors.white)),onPressed: (){
                        cubit!.createModel(CreateCallRequest(
                            leaderId:leaderId,
                            screenId: myMinistryModel!.screens![0].id
                        ));
                      },),
                    ),
                  ),
                ],
              ),
            ),
          ]);
        });
  }
}
