

import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';

import '../../features/select_unit_journy/presentation/widgets/logo_image.dart';
import '../constants/app_assets.dart';
import '../constants/app_dimension.dart';

class DefaultScaffoldWithCenterLogo extends StatelessWidget {
  final Widget? body;
  final String? logoUrl;

  const DefaultScaffoldWithCenterLogo({Key? key, this.body, this.logoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child:
            Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      Navigation.pop(context);
                    },
                  )
                ],
              ),
              SizedBox(
                height: AppDimension.screenHeight(context) * 3 / 10,
                child: LogoImage(imageUrl:logoUrl),

              ),




              body!
            ])));
  }
}
