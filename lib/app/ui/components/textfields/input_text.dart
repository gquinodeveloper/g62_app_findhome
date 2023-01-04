
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g62_find_home/core/theme/app_colors.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    this.inputFormatter,
    this.isMoney = false,
    this.isOTP = false,
    this.textAlign = TextAlign.start,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization,
    this.autofocus = false,
    this.initialValue,
    this.readOnly = false,
    this.controller,
    this.iconPrefix,
    this.iconColor,
    this.labelText,
    this.filled = true,
    this.fontColor,
    this.fontSize,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.hintText,
    this.errorText,
    this.minLines = 1,
    this.maxLines,
    this.maxLength = 70,
    this.border,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.onSaved,
  }) : super(key: key);

  final List<TextInputFormatter>? inputFormatter;
  final bool isMoney;
  final bool isOTP;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final TextCapitalization? textCapitalization;
  final bool autofocus;
  final String? initialValue;
  final bool readOnly;
  final TextEditingController? controller;
  final IconData? iconPrefix;
  final Color? iconColor;
  final String? labelText;
  final bool? filled;
  final Color? fontColor;
  final double? fontSize;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? hintText;
  final String? errorText;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final InputBorder? border;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final VoidCallback? onTap;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatter,
      textAlign: textAlign,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      autofocus: autofocus,
      initialValue: initialValue,
      style: Theme.of(context)
          .textTheme
          .caption
          ?.copyWith(color: fontColor, fontWeight: FontWeight.bold),
      cursorColor: AppColors.blueDark,
      decoration: InputDecoration(
        icon: Icon(
          iconPrefix,
          size: 18.0,
        ),
        labelText: labelText,
        labelStyle: Theme.of(context)
            .textTheme
            .caption
            ?.copyWith(color: AppColors.blueDark),
        filled: filled,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: isMoney
            ? Theme.of(context).textTheme.headline3?.copyWith(
                  color: fontColor!.withOpacity(0.3),
                  fontWeight: FontWeight.bold,
                )
            : null,
        counterText: "",
        errorText: errorText,
      ),
      readOnly: readOnly,
      onEditingComplete: onEditingComplete,
      controller: controller,
      onSaved: onSaved,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
    );
  }
}