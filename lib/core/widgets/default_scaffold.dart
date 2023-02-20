import 'package:flutter/material.dart';

import '../../features/select_unit_journy/presentation/widgets/logo_image.dart';
import '../constants/app_assets.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget? body;
  final String? logoUrl;

  const DefaultScaffold({Key? key, this.body,this.logoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            padding:const EdgeInsets.all(24),
            decoration:const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [LogoImage(imageUrl: logoUrl)],
                  ),
                  body!
            ])));
  }
}
