import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';

import '../../../../core/utils/navigation.dart';
import '../../../../core/widgets/default_scaffold.dart';
import '../../../../features/select_department_journy/presentation/widgets/main_elevated_button.dart';
import '../../../booking_information/data/clients_requests_model.dart';
import '../../data/time_model.dart';
import '../widgets/time_row.dart';
import 'job_number_page.dart';

class ClientBookDetails extends StatelessWidget {
  final String? logoUrl;
  final OneClientRequest? oneClientRequest;

  const ClientBookDetails({Key? key,this.logoUrl,this.oneClientRequest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(logoUrl:logoUrl ,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: AppDimension.screenWidth(context)/4),
          child: Column(
      children: [...[
          Text("الطلب رقم 0-1000",style: AppTheme.bodyText1,),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.lightGrey, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [...[
              Text("زمن الانتظار للطلب",
                style: AppTheme.bodyText1.copyWith(color: AppColors.lightBlueColor),),
              TimeRow(timeModel: TimeModel(second: "20",minutes: "10",hour: "1"),),
              Container(
                padding: EdgeInsets.all(16),
                color: AppColors.white,child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                Text("876543456"),
                Text("إدارة الشؤون الإدارية"),
                Text("0-00015"),
             ])) ].expand((element) => [element,SizedBox(height: 16)],),

            ],),
          ),
          MainElevatedButton(
            text: "enter_job_id".tr(),
            onTap: () {
              Navigation.push(context, JobNumberPage());
            },
          )
      ].expand((element) => [element,SizedBox(height: 24,)])],
    ),
        ));
  }
}
