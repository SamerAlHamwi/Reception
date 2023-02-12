import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/constant.dart';

class MainTextField extends StatefulWidget {
  final String? hintText;
  final double? height;
  final IconData? iconData;
  final String? imageData;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  const MainTextField(
      {Key? key,
      required this.hintText,
      this.iconData,
      this.imageData,
      this.keyboardType,
      this.isPassword = false,
      this.focusNode,
      this.height})
      : super(key: key);

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  bool? obscureText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obscureText = widget.isPassword!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: widget.height ?? 50,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          obscureText: obscureText!,
          style: const TextStyle(
              fontSize: 12, color: Colors.black, fontFamily: 'SFUIDisplay'),
          //   style: AppTheme.bodyText2,
          keyboardType: widget.keyboardType ?? TextInputType.emailAddress,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: widget.isPassword!
                ? IconButton(
                    icon: Icon(obscureText!
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,color: AppColors.primaryColor,),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText!;
                      });
                    },
                  )
                : null,
            prefixIcon: widget.iconData != null
                ? Icon(
                    widget.iconData,
                    color: AppColors.darkGrey,
                    size: 20,
                  )
                : widget.imageData != null
                    ? ImageIcon(
                        AssetImage(widget.imageData!),
                        color: AppColors.grey,
                        size: 20,
                      )
                    : null,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: AppColors.darkGrey),
          ),
          // focusNode: focusNode
        ));
  }
}
