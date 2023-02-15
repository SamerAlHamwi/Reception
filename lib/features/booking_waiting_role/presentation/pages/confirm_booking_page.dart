import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/constant.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/navigation.dart';
import '../../../booking_information/presentation/pages/waiting_list_page.dart';
import '../../../select_department_journy/presentation/widgets/logo_image.dart';
import '../../../select_department_journy/presentation/widgets/main_elevated_button.dart';
import '../widgets/key_value_row.dart';

class ConfirmBookingPage extends StatelessWidget {
  const ConfirmBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child: LayoutBuilder(builder: (context, sizes) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...[
                      Row(
                        children: [
                          LogoImage(
                            radius: 100,
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      Icon(
                        Icons.security_outlined,
                        color: AppColors.lightBlueColor,
                        size: 70,
                      ),
                      Text(
                        "تمت عملية الحجز بنجاح!",
                        style: AppTheme.headline3.copyWith(
                            color: AppColors.black.withOpacity(0.8),
                            fontSize: 18),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizes.maxWidth * 3 / 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...[
                              KeyValueRow(
                                  keyText: "الرقم المدني",
                                  value: "8765432345678"),
                              KeyValueRow(
                                  keyText: "الجهة",
                                  value: "إدارة الشؤون الإداربة"),
                              KeyValueRow(
                                  keyText: "رقم الدور", value: "0-00012"),
                              KeyValueRow(
                                  keyText: " التاريخ", value: "10/2/2023"),
                            ].expand((element) => [
                                  element,
                                  SizedBox(
                                    height: 16,
                                  )
                                ]),
                            Container(
                                height: 55,
                                child: MainElevatedButton(
                                  onTap: () {
                                    Navigation.push(context, WaitingListPage());
                                  },
                                  text: "إنهاء العملية",
                                ))
                          ],
                        ),
                      ),
                    ].expand((element) => [
                          element,
                          SizedBox(
                            height: 16,
                          )
                        ])
                  ]);
            })));
  }
}
