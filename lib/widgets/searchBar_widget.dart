import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only( top: 10),
      height: 70,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'You recent task here ...',
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            gapPadding: 1
          ),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}