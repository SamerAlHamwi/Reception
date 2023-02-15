import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';
import 'package:ministries_reception_app/features/select_department_journy/presentation/widgets/main_elevated_button.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../select_department_journy/presentation/pages/disabled_gategory_page.dart';
import '../../../select_department_journy/presentation/widgets/logo_image.dart';
import '../widgets/one_client_request_card.dart';

class WaitingListPage extends StatelessWidget {
  const WaitingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
      child: LayoutBuilder(builder: (context, sizes) {
        return Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LogoImage(
                radius: 100,
              )
            ],
          ),
          Text("قائمة الانتظار"),
          Container(
            height: sizes.maxHeight/3,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 8,
                  );
                },
                itemBuilder: ((context, index) {
                  return OneVisitorCard();
                }),
                itemCount: 3),
          ),
          MainElevatedButton(onTap: (){
            Navigation.push(context,DisabledGategoryPage() );

          },text: "حجز دور جديد")
        ]);
      }),
    ));
  }
}
