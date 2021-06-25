import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:go_class_app/widgets/utils/inputStyle.dart';

class GenericInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? validator;
  final Function(String)? onChanged;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool? autofocus;
  final TextAlign? textAlign;
  const GenericInput({
    Key? key,
    this.hintText = '',
    this.validator,
    this.onChanged,
    this.maxLength,
    this.keyboardType,
    this.autofocus,
    this.controller,
    this.textAlign,
  }) : super(key: key);

  @override
  _GenericInputState createState() => _GenericInputState();
}

class _GenericInputState extends State<GenericInput> {
  final TextEditingController _controller = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16)),
      child: TextFormField(
        textAlign: widget.textAlign ?? TextAlign.start,
        controller: widget.controller ?? _controller,
        autofocus: widget.autofocus ?? false,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        validator: widget.validator as String? Function(String?)?,
        onChanged: widget.onChanged,
        maxLength: widget.maxLength ?? 32,
        cursorColor: Theme.of(context).primaryColor,
        decoration: inputDecorationDialog(context, widget.hintText),
        style: AppFont.font(
            TextStyle(color: Theme.of(context).textTheme.headline3!.color)),
      ),
    );
  }
}
