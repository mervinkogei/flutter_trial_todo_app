import 'package:flutter/material.dart';
import 'package:trial_todo_app/Utils/app_Colors.dart';

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({required this.checked, super.key});
  bool checked;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
    @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox.adaptive(
        activeColor: AppColors.kPrimary,
        checkColor: AppColors.kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: const BorderSide(color: AppColors.kPrimary, width: 2.75),
        value: widget.checked,
        onChanged: (checked) {
          setState(() {
            widget.checked = checked ?? false;
          });
        },
      ),
    );
  }
}