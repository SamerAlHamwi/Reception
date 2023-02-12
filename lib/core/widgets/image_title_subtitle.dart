import 'package:flutter/material.dart';
import '../../core/constants/app_theme.dart';

class ImageTitleSubtitle extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? imageUrl;

  const ImageTitleSubtitle({Key? key, this.title, this.subTitle, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, sizes) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
              child: Image.asset(
                imageUrl!,
                height: sizes.maxHeight * 60 / 100,
              )),
          SizedBox(height: sizes.maxHeight * 10 / 100),
          Text(title!,
              style: AppTheme.flexHeadline2(
                  sizes.maxHeight * 7 / 100, sizes.maxWidth).copyWith(overflow: TextOverflow.ellipsis)),
          SizedBox(height: sizes.maxHeight * 2 / 100),
          Text(subTitle!,
              style: AppTheme.flexBodyText2(
                  sizes.maxHeight * 21 / 100, sizes.maxWidth-80)),
        ]),
      );
    });
  }
}
