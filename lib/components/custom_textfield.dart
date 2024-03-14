import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  TextEditingController? controller;
  int? maxLines;
  bool obscure;
  String? hintText;
  bool? visibilityIcon;
  CustomTextField({required this.controller, required this.obscure, this.maxLines, this.visibilityIcon, this.hintText});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode myfocus = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: TextFormField(
        obscureText: widget.obscure,
        maxLines: widget.maxLines ?? 1,
        controller: widget.controller,
        cursorColor: Colors.black,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(height:1),
        validator:(value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ${widget.hintText}';
              }
              return null;
            },
        focusNode: myfocus,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.visibilityIcon == true ? InkWell(
            onTap: (){
             setState(() {
                widget.obscure = !widget.obscure;
             });
            },
            child: InkWell(child: Icon(!widget.obscure? Icons.visibility: Icons.visibility_off))) : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black),
          ),
           border: OutlineInputBorder(
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
