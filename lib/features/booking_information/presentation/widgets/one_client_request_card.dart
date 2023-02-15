//one_client_request_card.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../treat_client_request/presentation/pages/client_book_details.dart';


class OneVisitorCard extends StatelessWidget {

  OneVisitorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(onTap: (){
      Navigation.push(context, ClientBookDetails());
    },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 60,
        decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [BoxShadow(color: AppColors.grey, offset: Offset(0, 2))]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Text("إدارة الشؤون الإدارية",
                style: AppTheme.bodyText1),
            Text("0-000051",
                style: AppTheme.bodyText1),

          ],
        ),
      ),
    );
  }
}
