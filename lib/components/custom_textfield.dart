
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController? controller;
  bool  obscure;
  CustomTextField({required this.controller, required this.obscure});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode myfocus = FocusNode();
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      myfocus.requestFocus(); //auto focus on second text field.
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: TextField(
        // inputFormatters:[FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9.@]'))],
        obscureText: widget.obscure,
        controller: widget.controller,
        cursorColor: Colors.black,
        style: const TextStyle(
          height: 1.6,
        ),
        focusNode: myfocus,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(bottom: -10.0),
          border: InputBorder.none,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}