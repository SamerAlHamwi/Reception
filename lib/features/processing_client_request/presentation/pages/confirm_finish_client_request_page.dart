import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_dimension.dart';
import 'package:ministries_reception_app/core/constants/app_theme.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';
import 'package:ministries_reception_app/core/widgets/default_scaffold.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../select_unit_journy/presentation/pages/welcome_page.dart';
import '../../../select_unit_journy/presentation/widgets/main_elevated_button.dart';

class ConfirmFinishClientRequestPage extends StatelessWidget {
  final String? logoUrl;

  const ConfirmFinishClientRequestPage({this.logoUrl ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      logoUrl: logoUrl,
      body: Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension.screenWidth(context) / 4),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            ...[
              const Icon(
                Icons.security_outlined,
                color: AppColors.lightBlueColor,
                size: 60,
              ),
              Text("تم استلام طلب العميل رقم 0-1000 بنجاح",
                  style: AppTheme.headline3, textAlign: TextAlign.center),
              MainElevatedButton(
                onTap: () {
                  Navigation.push(context, WelcomePage());
                },
                text: "back_to_the_beginning".tr(),
              )
            ].expand((element) => [
                  element,
                  const SizedBox(
                    height: 24,
                  )
                ])
          ]),
        ),
      ),
    );
  }
}
