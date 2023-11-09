import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputLogin extends StatefulWidget {
  final String labelInput;
  final IconData prefexIcon;
  IconData? sufxIcon;
  bool isVisibility;
  final TextInputFormatter? format;
  final TextInputType input;
  InputLogin(
      {Key? key,
      required this.labelInput,
      required this.prefexIcon,
      this.sufxIcon,
      this.isVisibility = false,
      this.format,
      required this.input})
      : super(key: key);

  @override
  State<InputLogin> createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.input,
      obscureText: widget.isVisibility,
      inputFormatters: widget.format != null ? [widget.format!] : [],
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefexIcon),
        suffixIcon: widget.sufxIcon != null
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.isVisibility = !widget.isVisibility;
                  });
                },
                icon: Icon(widget.isVisibility
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined),
              )
            : null,
        isDense: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        labelText: widget.labelInput,
      ),
    );
  }
}
