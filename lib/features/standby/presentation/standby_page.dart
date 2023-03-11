import 'package:flutter/material.dart';

import '../../../core/boilerplate/get_model/widgets/GetModel.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/logout_popup_menu_button.dart';
import '../../select_unit_journy/data/my_ministriy_model.dart';
import '../../select_unit_journy/repository/ministriey_repo.dart';

class StandByPage extends StatelessWidget {
  const StandByPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetModel<MyMinistryModel>(
        repositoryCallBack: (data) => MinistrieyRepo.getMyMinistries(),
        modelBuilder: (MyMinistryModel myMinistryModel) {
          return Scaffold(
            backgroundColor: AppColors.black,
            body: Stack(
              children: [
                Center(
                  child: CustomImage.circular(
                    radius: 350,
                    image: myMinistryModel!.attachment!.url,
                    isNetworkImage: true,
                    fit: BoxFit.contain,
                    svg: false,

                )),
                const Align(
                    alignment: Alignment.topLeft,
                    child: LogoutPopupMenuButton(color: AppColors.white)),
              ],
            ),
          );
        });
  }
}
