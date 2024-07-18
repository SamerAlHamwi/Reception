import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_theme.dart';

import '../../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/widgets/default_scaffold.dart';
import '../../../select_unit_journy/data/my_ministriy_model.dart';
import '../../repository/call_reception_repo.dart';
import '../widgets/leaders_card.dart';
import 'client_name_screen.dart';

class LeadersPage extends StatelessWidget {
  final MyMinistryModel? myMinistryModel;
  final int? departmentId;

  const LeadersPage({Key? key, this.myMinistryModel, this.departmentId})
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        "select_service".tr(),
                        style: AppTheme.headline3,
                      ),
                    ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                          direction: Axis.horizontal, //default
                          spacing: 24,
                          runSpacing: 24,
                          children: department.employees != null
                              ? [
                                  ...department.employees!
                                      .map((Employees employee) => LeadersCard(
                                            leaderDetails: employee,
                                            onTap: () {
                                              Navigation.push(
                                                  context,
                                                  ClientNameScreen(
                                                      leaderId: employee.id,
                                                      departmentId:
                                                          departmentId,
                                                      myMinistryModel:
                                                          myMinistryModel));
                                            },
                                          ))
                                      .toList()
                                ]
                              : []),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

// CreateModelCubit? cubit;
// _showConfirmDialog(context, leaderId) {
//   return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20.0))),
//             title: Text('are_you_sure'.tr(),style: AppTheme.headline3,),
//             actions: <Widget>[
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     CreateModel(
//                       repositoryCallBack: (data) =>
//                           CallReceptionRepo.createCards(data),
//                       onCubitCreated: (CreateModelCubit c) {
//                         cubit = c!;
//                       },
//                       onSuccess: (model) {
//                         Navigator.pop(context);
//                         Navigation.pushAndRemoveUntil(context, WelcomeCallReceptionPage());
//                       },
//                       child: Container(
//                         width: MediaQuery.of(context).size.width / 8,
//                         height: 75,
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                             color: AppColors.primaryColor,
//                             borderRadius:
//                             BorderRadius.all(Radius.circular(20.0))),
//                         child: TextButton(
//                           child: Text('yes'.tr(),
//                               style: AppTheme.bodyText1
//                                   .copyWith(color: Colors.white)),
//                           onPressed: () {
//                           //  myMinistryModel!.screens=[];
//                             if(myMinistryModel!.screens!=null){
//                             if (myMinistryModel!.screens!.length>0){
//                             cubit!.createModel(CreateCallRequest(
//                                 leaderId: leaderId,
//                                 screenId: myMinistryModel!.screens![0].id));
//                             }
//                             else{
//                               _showAlertForCreateScreen(context);
//                             }
//                           }else{
//                               _showAlertForCreateScreen(context);
//
//                             }
//
//                           }
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Container(
//                       width: MediaQuery.of(context).size.width / 8,
//                       height: 75,
//                       padding:const EdgeInsets.all(8),
//                       decoration:const BoxDecoration(
//                           color: AppColors.lightBlueColor,
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(20.0))),
//                       child: TextButton(
//                           onPressed: () {
//                             Navigation.pop(context);
//                           },
//                           child: Text('no'.tr(),
//                               style: AppTheme.headline3
//                                   .copyWith(color: AppColors.white))),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ]);
//       });
// }

// _showAlertForCreateScreen(context)
// {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//     return AlertDialog(
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(20.0))),
//       title: Text('you_need_create_screen_account'.tr()),actions: [
//         Center(
//           child: Container(
//       width: MediaQuery.of(context).size.width / 8,
//       height: 50,
//       padding:const EdgeInsets.all(8),
//       decoration:const BoxDecoration(
//             color: AppColors.primaryColor,
//             borderRadius:
//             BorderRadius.all(Radius.circular(20.0))),
//       child: TextButton(
//             onPressed: () {
//               Navigation.pop(context);
//               Navigation.pop(context);
//             },
//             child: Text('ok'.tr(),
//                 style: AppTheme.bodyText2
//                     .copyWith(color: AppColors.white))),
//     ),
//         ),
//     ],
//
//     );
//       });
// }
}
