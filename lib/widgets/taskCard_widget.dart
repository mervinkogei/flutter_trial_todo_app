import 'package:flutter/material.dart';
import 'package:trial_todo_app/Utils/data_function.dart';
import 'package:trial_todo_app/Utils/textStyling.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        children: List.generate(2, (index) {
          return Card(
            color: Colors.blue[50],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.bookmark_add_outlined,
                      size: 40,
                    ),
                    const Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                      size: 25,
                    ),
                  ],
                ),
                const Text(
                  'Reading Article',
                  style: ThemeStyling.taskCardTitle,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Deadline: '),
                    Text('4pm'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: const Text(
                        'Complete a Task',
                        textAlign: TextAlign.center,
                      )),
                )
              ],
            ),
          );
        }));
  }
}
