import 'package:flutter/material.dart';

import '../constants/constant.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 1,
          color: AppColors.lightBlueColor,
        ),
      ),
    );
  }
}
