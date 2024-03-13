import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        padding: const EdgeInsets.only( top: 12, bottom: 10),
        height: 80,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'You recent task here ...',
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              gapPadding: 1
            ),
            suffixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}