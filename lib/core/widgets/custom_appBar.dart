import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  CustomAppBar({Key? key, this.title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottomOpacity: 0.0,
      title: Text(
        title!.tr(),
      ),
    );
  }
}
