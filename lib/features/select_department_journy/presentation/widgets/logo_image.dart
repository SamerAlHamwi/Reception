
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/custom_image.dart';
class LogoImage extends StatelessWidget {
  final double? radius;
  const LogoImage({Key? key,this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
     // alignment: Alignment.center,
      // height: sizes.maxHeight * 3 / 10,
      child: CustomImage.circular(
        image: AppAssets.appLogoURI,
        radius:radius?? 200,
        isNetworkImage: false,
        svg: false,
      ),
    );
  }
}
