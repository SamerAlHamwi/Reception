
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_dimension.dart';
import '../../../../core/widgets/custom_image.dart';
class LogoImage extends StatelessWidget {
  final double? radius;
  final String?imageUrl;
  const LogoImage({Key? key,this.radius,this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: AppDimension.screenHeight(context) *2/ 10,

      child: AspectRatio(aspectRatio: 200/200,
        child: CustomImage.circular(
          image: imageUrl??"assets/images/placeholder.jpg",
          radius:radius?? 200,
          isNetworkImage: imageUrl==null?false:true,
          svg: false,
        ),
      ),
    );
  }
}
