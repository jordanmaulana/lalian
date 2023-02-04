import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import 'texts.dart';

class VFormInput extends StatelessWidget {
  final String? label;
  final String? hint;
  final double radius;
  final bool obscure;
  final Color? fillColor;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool enabled;
  final void Function(String?)? onChanged;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Color? borderColor;
  final void Function(String?)? onSubmit;
  final void Function()? onTap;
  final bool autoFocus;
  final Iterable<String>? autoFill;
  final int? maxLength;

  const VFormInput({
    this.label,
    this.hint,
    this.radius = 8.0,
    this.obscure = false,
    this.suffixIcon,
    this.validator,
    this.onSaved,
    this.fillColor,
    this.controller,
    this.enabled = true,
    this.onChanged,
    this.maxLines,
    this.keyboardType,
    this.borderColor = VColor.textFieldGrey,
    this.onSubmit,
    this.onTap,
    this.textCapitalization = TextCapitalization.sentences,
    this.autoFocus = false,
    this.maxLength,
    this.autoFill,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autofillHints: autoFill,
          maxLength: maxLength,
          autofocus: autoFocus,
          onTap: onTap,
          style: GoogleFonts.hind(fontSize: 20.0),
          enabled: enabled,
          controller: controller,
          obscureText: obscure,
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
          maxLines: obscure ? 1 : maxLines,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          onFieldSubmitted: onSubmit,
          decoration: InputDecoration(
            label: VText(label),
            suffixIcon: suffixIcon,
            hintText: hint,
            fillColor: fillColor,
            filled: fillColor != null,
            focusColor: VColor.primaryButton,
            hintStyle: GoogleFonts.hind(fontSize: 20.0),
          ),
        ),
      ],
    );
  }
}

class VDropdown<T> extends StatelessWidget {
  const VDropdown({
    Key? key,
    required this.dropdownItems,
    required this.onChanged,
    this.dropDownValue,
    this.label,
    this.focusNode,
    this.hint,
    this.validator,
    this.fillColor,
    this.borderColor,
  }) : super(key: key);

  final List<DropdownMenuItem<T>> dropdownItems;
  final void Function(T) onChanged;
  final T? dropDownValue;
  final String? hint;
  final String? label;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      alignment: Alignment.center,
      child: DropdownButtonFormField(
        focusNode: focusNode,
        isExpanded: true,
        hint: VText(hint, overflow: TextOverflow.ellipsis, color: VColor.hint),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
            fillColor: fillColor,
            filled: fillColor != null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor ?? VColor.border),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor ?? VColor.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: VColor.primaryButton),
            )),
        items: dropdownItems,
        value: dropDownValue,
        icon: const Icon(Icons.arrow_drop_down),
        onChanged: <T>(value) => onChanged(value),
        dropdownColor: fillColor,
        isDense: false,
      ),
    );
  }
}
