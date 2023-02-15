import 'package:flutter/material.dart';

import '../../features/select_department_journy/presentation/widgets/logo_image.dart';
import '../constants/app_assets.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget? body;

  const DefaultScaffold({Key? key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                child: Row(
                  children: [
                    LogoImage(
                      radius: 100,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ),
                  body!
            ])));
  }
}
