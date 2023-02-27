import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

class StandByPage extends StatelessWidget {
  const StandByPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(child: Image.asset(AppAssets.appLogoURI)),
    );
  }
}
