import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../constants/constant.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData? icon;
  final String? imageData;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final ValueChanged<String>? onChanged;
  final void Function()? onEditComplete;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final bool? general;
  final bool? withOutPadding;
  final bool? required;
  final bool? enabled;
  final bool? withTitle;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final GestureTapCallback? onTap;
  final InputDecoration? inputDecoration;

  const CustomTextField(
      {Key? key,
      this.labelText = "",
      required this.hintText,
      this.icon,
      this.imageData,
      this.onEditComplete,
      this.validator,
      this.onChanged,
      this.obscureText = false,
      this.textInputAction,
      this.keyboardType,
      this.autofocus = false,
      this.controller,
      this.general = false,
      this.withTitle = false,
      this.required = false,
      this.enabled = true,
      this.maxLength,
      this.maxLines = 1,
      this.minLines,
      this.onTap,
      this.withOutPadding=false,
      this.inputDecoration})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isSeen = false;
  late InputDecoration _inputDecoration;

  @override
  void initState() {
    super.initState();
    if (widget.inputDecoration == null) {
      _inputDecoration = !widget.general!
          ? AppTheme.inputDecoration.copyWith(
              counterText: "",
              prefixIcon: widget.icon != null
                  ? Icon(
                      widget.icon,
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
              fillColor: AppColors.lightGrey)
          : InputDecoration(
              counterText: "",
              label: Row(
                children: [
                  Text(widget.labelText),
                  if (widget.required!)
                    const Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                ],
              ));
    } else {
      _inputDecoration = widget.inputDecoration!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:widget.withOutPadding==true?0:16 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.withTitle!
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.labelText,
                      style: AppTheme.bodyText2
                          .copyWith(color: AppColors.primaryColor)))
              : Container(),
          TextFormField(
            onEditingComplete:widget.onEditComplete!=null? widget.onEditComplete:null,
            enabled: widget.enabled!,
            onTap: widget.onTap,
            expands: widget.maxLength == 0 ? true : false,
            controller: widget.controller ?? TextEditingController(),
            decoration: _inputDecoration.copyWith(
                contentPadding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                hintText: !widget.required!
                    ? widget.hintText
                    : widget.hintText + ' *',
                hintStyle: AppTheme.bodyText1.copyWith(
                  color: AppColors.darkGrey,
                ),
                suffixIcon: widget.obscureText!
                    ? PlatformIconButton(
                        onPressed: () {
                          setState(() {
                            isSeen = !isSeen;
                          });
                        },
                        icon: Icon(
                            isSeen
                                ? context.platformIcons.eyeSolid
                                : context.platformIcons.eyeSlashSolid,
                            size: 15),
                      )
                    : null),
            validator: widget.validator,
            style: AppTheme.bodyText1,
            obscureText: !isSeen ? widget.obscureText! : false,
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            autofocus: widget.autofocus!,
            maxLength: widget.maxLength,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
          ),
        ],
      ),
    );
  }
}
