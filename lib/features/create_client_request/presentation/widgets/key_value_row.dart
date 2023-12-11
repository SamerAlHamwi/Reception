import 'package:flutter/material.dart';
import 'package:ministries_reception_app/core/constants/app_theme.dart';

class KeyValueRow extends StatelessWidget {
  final String? keyText;
  final String? value;

  const KeyValueRow({Key? key, this.keyText, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          keyText!,style: AppTheme.headline3,
        ),
        Text("  :  ",style: AppTheme.headline3),
        Text(value!,style: AppTheme.headline3)
      ],
    );
  }
}
