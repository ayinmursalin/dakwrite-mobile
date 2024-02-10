import 'package:dakwrite/theme/common_colors.dart';
import 'package:dakwrite/theme/common_typography.dart';
import 'package:flutter/material.dart';

enum CommonTextFieldValidator {
  email,
  noEmpty,
  min5Characters,
  equalToComparator;
}

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final EdgeInsets margin;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? comparatorController;
  final List<CommonTextFieldValidator>? validators;

  const CommonTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.margin = EdgeInsets.zero,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.minLines,
    this.maxLines = 1,
    this.comparatorController,
    this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: CommonTypography.textTitleSmall,
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              alignLabelWithHint: false,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: CommonColors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CommonColors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: true,
              hintText: hint,
              labelStyle: CommonTypography.textCaptionLarge,
              floatingLabelStyle: CommonTypography.textBodyLarge,
              hintStyle: CommonTypography.textCaption,
              prefixIcon: prefixIcon != null
                  ? UnconstrainedBox(child: prefixIcon)
                  : null,
              suffixIcon: suffixIcon,
            ),
            minLines: minLines,
            maxLines: maxLines,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            obscureText: obscureText,
            validator: _validate,
          ),
        ],
      ),
    );
  }

  String? _validate(String? value) {
    final inputLength = value?.length ?? 0;

    if (contain(CommonTextFieldValidator.noEmpty) && inputLength <= 0) {
      return 'Harap masukkan $label';
    }
    if (contain(CommonTextFieldValidator.min5Characters) && inputLength < 5) {
      return '$label minimal 5 karakter';
    }
    if (contain(CommonTextFieldValidator.email)) {
      final isValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(value!);

      if (!isValid) return 'Email tidak valid';
    }
    if (contain(CommonTextFieldValidator.equalToComparator) &&
        value != comparatorController?.text) {
      return '$label tidak sama';
    }

    return null;
  }

  bool contain(CommonTextFieldValidator type) {
    return validators?.contains(type) == true;
  }
}
