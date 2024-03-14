import 'package:flutter/material.dart';
import 'package:trial_todo_app/Utils/textStyling.dart';

// ignore: must_be_immutable
class CustomElevatedButtton extends StatefulWidget {
  VoidCallback? callback;
  String? labelTitle;
  CustomElevatedButtton({this.callback, this.labelTitle});

  @override
  State<CustomElevatedButtton> createState() => _CustomElevatedButttonState();
}

class _CustomElevatedButttonState extends State<CustomElevatedButtton> {

bool colorTheme = true;
@override
  void initState() {
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 50,
          child: ElevatedButton(
            onPressed: widget.callback,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text('${widget.labelTitle}', style: ThemeStyling.buttonText),
          ),
        ),
      ],
    );
  }
}