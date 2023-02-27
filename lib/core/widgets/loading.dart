import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import '../constants/constant.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Center(

        child:LoadingBouncingGrid.square(
          borderColor:AppColors.primaryColor,
          backgroundColor: AppColors.primaryColor,
          size: 80.0,
        )
    );
  }
}
