import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MotoBillsTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final double borderRadius;
  final Function(String)? onChanged;
  final int? maxLength;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool enabled;
  final Color? fillColor;
  final bool? filled;
  final int? minLines;
  final int? maxLines;
  final bool isPassword;
  final String? initialValue;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final Widget? prefix;
  final Function(String)? onFieldSummitted;

  final bool? addDisableBorder;
  final TextAlign? textAlign;
  final bool? disableBorder;

  const MotoBillsTextFormField({
    Key? key,
    this.controller,
    this.disableBorder = false,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.borderRadius = 8,
    this.onChanged,
    this.maxLength,
    this.validator,
    this.suffixIcon,
    this.enabled = true,
    this.fillColor,
    this.filled,
    this.onFieldSummitted,
    this.autovalidateMode,
    this.minLines = 1,
    this.maxLines = 1,
    this.prefixIcon,
    this.prefix,
    this.initialValue,
    this.inputFormatters,
    this.focusNode,
    this.textAlign = TextAlign.left,
    this.addDisableBorder = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<MotoBillsTextFormField> createState() => _MotoBillsTextFormFieldState();
}

class _MotoBillsTextFormFieldState extends State<MotoBillsTextFormField> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? _visible : false,
      initialValue: widget.initialValue,
      textAlign: widget.textAlign!,
      controller: widget.controller,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      validator: widget.validator,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      onFieldSubmitted: widget.onFieldSummitted,
      inputFormatters: widget.inputFormatters,
      focusNode: widget.focusNode,

      autovalidateMode: widget.autovalidateMode,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        counter: Offstage(),
        hintText: widget.hintText,
        errorMaxLines: 3,
        prefix: widget.prefix,
        suffixIcon: widget.suffixIcon ??
            (widget.isPassword
                ? IconButton(
              icon: _visible
                  ? const Icon(
                Icons.visibility,
                color: Color(0xffacacac),
              )
                  : const Icon(
                Icons.visibility_off,
                color: Color(0xffacacac),
              ),
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
            )
                : null),
        prefixIcon: widget.prefixIcon,
        enabled: widget.enabled,
        fillColor: widget.fillColor,
        filled: widget.filled,
        suffixIconConstraints: BoxConstraints(
          minHeight: 24,
          minWidth: 24,
        ),
        prefixIconConstraints: BoxConstraints(
          minHeight: 24,
          minWidth: 24,
        ),
        contentPadding: EdgeInsets.only(
          left: 10,
        ),

        focusedBorder: widget.disableBorder!
            ? OutlineInputBorder(borderSide: BorderSide.none)
            : OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ),
          borderSide: BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        disabledBorder: widget.addDisableBorder!
            ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ),
          borderSide: BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        )
            : null,
        enabledBorder: widget.disableBorder!
            ? OutlineInputBorder(borderSide: BorderSide.none)
            : OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ),
          borderSide: BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),

        border: !widget.enabled || widget.disableBorder!
            ? OutlineInputBorder(borderSide: BorderSide.none)
            : OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ),
        ),
      ), //buildInputDecoration('ID card number'),,
    );
  }
}