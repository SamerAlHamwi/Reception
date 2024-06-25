import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';

import '../../features/select_unit_journy/presentation/widgets/logo_image.dart';
import '../constants/app_assets.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? previousPage;
  final String? logoUrl;
  final bool? withPadding;

  const DefaultScaffold({Key? key, this.body, this.logoUrl, this.previousPage,this.withPadding=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            padding:withPadding!? const EdgeInsets.symmetric(horizontal: 16):null,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.background), fit: BoxFit.fill)),
            child: Stack(fit: StackFit.expand, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LogoImage(imageUrl: logoUrl),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      if (previousPage == null) {
                        Navigation.pop(context);
                      } else {
                        Navigation.pushAndRemoveUntil(context, previousPage!);
                      }
                    },
                  )
                ],
              ),
              body!
            ])));
  }
}
