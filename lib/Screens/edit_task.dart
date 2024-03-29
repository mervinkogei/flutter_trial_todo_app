import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quickeydb/quickeydb.dart';
import 'package:trial_todo_app/Database/Models/task_model.dart';
import 'package:trial_todo_app/Database/Models/user_model.dart';
import 'package:trial_todo_app/Database/Schema/task_schema.dart';
import 'package:trial_todo_app/Screens/dashboard_nav.dart';
import 'package:trial_todo_app/Utils/data_function.dart';
import 'package:trial_todo_app/Utils/textStyling.dart';
import 'package:trial_todo_app/components/custom_elavatedButton.dart';
import 'package:trial_todo_app/components/custom_textfield.dart';

// ignore: must_be_immutable
class EditTaskScreen extends StatefulWidget {
  String ? taskName;
  int? taskId;
  String ? taskDesc;
  String ? taskStartDate;
  String ? taskEndDate;
  EditTaskScreen({super.key, this.taskName, this.taskDesc, this.taskEndDate, this.taskStartDate, this.taskId });

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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

  Future<void> editUserTask(Task task) async {
    await QuickeyDB.getInstance!<TaskSchema>()!.update(task);
   
    setState(() {});
  }

updateTask() async{
  if (_formKey.currentState!.validate()) {
    return await QuickeyDB.getInstance!<TaskSchema>()?.update(
      Task(
          id: widget.taskId,
          taskName: taskNameController.text,
          description: taskDescriptionController.text,
          startDate: startDateController.text,
          endDate: endDateController.text,
          user: User(name: "vincent", email: "vincentkogei@gmail.com")
          )          
          ).then((value) => 
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          ).closed.then((value) => 
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const DashBoardScreen()),
            (route) => false))      
      );  
  }
}


@override
  void initState() {
   setState(() {
     taskNameController.text = widget.taskName!;
     taskDescriptionController.text = widget.taskDesc!;
     startDateController.text =widget.taskStartDate!;
     endDateController.text = widget.taskEndDate!;
   });
   print(widget.taskId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Task', style: ThemeStyling.welcomeTitle),
          centerTitle: true,
        ),
        drawer: DataFunction.customMenuDrawer(context),
        body: SingleChildScrollView(
          child: Form(
          key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    ' Task Name',
                    style: ThemeStyling.welcomeTitle,
                  ),
                  CustomTextField(controller: taskNameController, obscure: false, hintText: 'task title',),
                  const SizedBox(height: 10,),
                  const Text(
                    ' Task Description',
                    style: ThemeStyling.welcomeTitle,
                  ),
                  CustomTextField(
                    controller: taskDescriptionController,
                    obscure: false,
                    maxLines: 5,
                    hintText: 'description',
                  ),
                  const SizedBox(height: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                                controller: startDateController,
                                validator:(value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter start Date';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(                              
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          const BorderSide(color: Colors.black),
                                    ),
                                    border: OutlineInputBorder(
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
                                    suffixIcon: const Icon(Icons.calendar_today),
                                    labelText: "Start Date"),
                                readOnly: true,
                                onTap: () => pickDateDialog(startDateController)),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: TextFormField(
                                controller: endDateController,
                                validator:(value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter end Date';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          const BorderSide(color: Colors.black),
                                    ),
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
                                    suffixIcon: const Icon(Icons.calendar_today),
                                    labelText: "End Date"),
                                readOnly: true,
                                onTap: () => pickDateDialog(endDateController)),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                 CustomElevatedButtton(
                  callback:() => editUserTask(
                    Task(
                    id: widget.taskId,
                    description: taskNameController.text, 
                    taskName: taskNameController.text, 
                    startDate: startDateController.text, 
                    endDate: endDateController.text,
                    user: User(name: "vincent", email: "vincentkogei@gmail.com",)
                    )
                  ),  labelTitle: 'Update Task',)
                ],
              ),
            ),
          ),
        ));
  }
}
