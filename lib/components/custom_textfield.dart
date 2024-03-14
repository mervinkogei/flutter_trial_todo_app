import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  TextEditingController? controller;
  int? maxLines;
  bool obscure;
  CustomTextField({required this.controller, required this.obscure, this.maxLines});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode myfocus = FocusNode();
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 0), () {
    //   myfocus.requestFocus(); 
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: TextField(
        // inputFormatters:[FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9.@]'))],
        obscureText: widget.obscure,
        maxLines: widget.maxLines ?? 1,
        controller: widget.controller,
        cursorColor: Colors.black,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(height:1),
        focusNode: myfocus,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 6,
            borderRadius: BorderRadius.circular(15),
            borderSide:  BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
