import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimension.dart';
import '../../../../core/widgets/custom_image.dart';

class CenterLogo extends StatelessWidget {
  final String? logoUrl;
  const CenterLogo({Key? key,this.logoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        alignment: Alignment.center,
        height: AppDimension.screenHeight(context) * 3 / 10,
        child: AspectRatio(
          aspectRatio: 200 / 200,
          child: CustomImage.circular(
            image: logoUrl,
            radius: 200,
            isNetworkImage: true,
            svg: false,
            fit: BoxFit.fill,
          ),
        ));
  }
}
