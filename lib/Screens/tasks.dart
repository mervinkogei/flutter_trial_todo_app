import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:trial_todo_app/Utils/data_function.dart';
import 'package:trial_todo_app/Utils/textStyling.dart';
import 'package:trial_todo_app/components/custom_textfield.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  pickDateDialog(TextEditingController? controller) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(pickedDate);
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(formattedDate);

      setState(() {
        controller!.text = formattedDate;
      });
    } else {
      print("Date is not selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Task', style: ThemeStyling.welcomeTitle),
          centerTitle: true,
        ),
        drawer: DataFunction.customMenuDrawer(context),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                ' Task Name',
                style: ThemeStyling.welcomeTitle,
              ),
              CustomTextField(controller: taskNameController, obscure: false),
              const SizedBox(height: 10,),
              const Text(
                ' Task Description',
                style: ThemeStyling.welcomeTitle,
              ),
              CustomTextField(
                controller: taskDescriptionController,
                obscure: false,
                maxLines: 5,
              ),
              const SizedBox(height: 20,),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            controller: startDateController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 6,
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2),
                                ),
                                suffixIcon: Icon(Icons.calendar_today),
                                labelText: "Start Date"),
                            readOnly: true,
                            onTap: () => pickDateDialog(startDateController)),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: TextField(
                            controller: endDateController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  gapPadding: 6,
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2),
                                ),
                                suffixIcon: Icon(Icons.calendar_today),
                                labelText: "End Date"),
                            readOnly: true,
                            onTap: () => pickDateDialog(endDateController)),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
