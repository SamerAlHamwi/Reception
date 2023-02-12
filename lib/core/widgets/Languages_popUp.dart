import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../utils/navigation.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../utils/shared_storage.dart';


class LanguagesPopUpMenu extends StatefulWidget {
  Locale locale;
  late Color color;
  late bool withRebirth;


  LanguagesPopUpMenu({required this.locale, this.color = Colors.white, this.withRebirth=false,Key? key})
      : super(key: key);

  @override
  State<LanguagesPopUpMenu> createState() => _LanguagesPopUpMenuState();
}

class _LanguagesPopUpMenuState extends State<LanguagesPopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      // initialValue:"ar",
        icon: Icon(
          Icons.more_vert,
          color: widget.color,
          size: 25,
        ),
        itemBuilder: (BuildContext context) =>
        [
          PopupMenuItem(
              child: PopupMenuButton(
                child: ListTile(
                  title: Text('language'.tr()),
                  leading: const Icon(
                    Icons.language,
                    size: 25,
                  ),
                ),
                itemBuilder: (BuildContext context) =>
                [
                  PopupMenuItem<String>(
                    value: "ar",
                    child: ListTile(title: Text('arabic'.tr())),
                  ),
                  PopupMenuItem<String>(
                    value: "en",
                    child: ListTile(title: Text('english'.tr())),
                  )
                ],
                onSelected: (String value) {
                  if (widget.locale != value) {
                    setState(() {
                       context.setLocale(AppConstant.languages[value]!);
                       SharedStorage.writeLanguage(widget.locale.toString());
                      Navigation.pop(context);
                      widget.withRebirth? Phoenix.rebirth(context):null;
                    });
                  }
                },
              ))
        ]);
  }
}
