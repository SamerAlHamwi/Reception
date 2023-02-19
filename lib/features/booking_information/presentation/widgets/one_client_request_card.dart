//one_client_request_card.dart
import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../select_department_journy/data/my_ministriy_model.dart';
import '../../../treat_client_request/presentation/pages/client_book_details.dart';
import '../../data/clients_requests_model.dart';

class OneVisitorCard extends StatelessWidget {
  final OneClientRequest? oneClientRequest;
  final MyMinistryModel? ministryModel;

  const OneVisitorCard({Key? key, this.oneClientRequest, this.ministryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigation.push(
            context,
            ClientBookDetails(
              logoUrl: ministryModel!.attachment!.url,
              oneClientRequest: oneClientRequest,
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 60,
        decoration: BoxDecoration(color: AppColors.white, boxShadow: [
          BoxShadow(color: AppColors.grey, offset: const Offset(0, 2))
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(oneClientRequest!.clientNationalNumberOrDisabilityNumber!,
                style: AppTheme.bodyText1),
            Text(
                oneClientRequest!.creationTime!.split("T")[0] +
                    "  /  " +
                    oneClientRequest!.creationTime!
                        .split("T")[1]
                        .toString()
                        .split(".")[0],
                style: AppTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
