import 'package:flutter/material.dart';
import 'package:quickeydb/quickeydb.dart';
import 'package:trial_todo_app/Database/Models/task_model.dart';
import 'package:trial_todo_app/Database/Schema/task_schema.dart';
import 'package:trial_todo_app/Database/Schema/user_schema.dart';
import 'package:trial_todo_app/Utils/data_function.dart';
import 'package:trial_todo_app/widgets/searchBar_widget.dart';

import '../Utils/textStyling.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 var itemCounter = 2;
 late UserSchema userItems;
 List<Task> tasks = [];


 Future<void>fetchTasksList() async{
  final response = await QuickeyDB.getInstance!<TaskSchema>()?.all;
  var responseData = response;
  for (var i = responseData!.length-1; i > -1; i--) {
  Task task = Task(
            taskName: responseData[i]!.taskName, 
            description: responseData[i]!.description, 
            startDate: responseData[i]!.startDate, 
            endDate: responseData[i]!.endDate
          );
          tasks.add(task);
        }
   }

showAlertDialog(BuildContext context, taskItem) {

    Future<void> deleteUserTask(Task task) async {
    await QuickeyDB.getInstance!<TaskSchema>()!.delete(task);
  
  }

  Widget okButton = ElevatedButton(
    child: const Text("Delete", style: ThemeStyling.deleteAlert,),
    onPressed: () =>Navigator.of(context, rootNavigator: true).pop(),
  ); 

  Widget cancelButton = ElevatedButton(
    child: const Text("Yes", style: ThemeStyling.acceptAlert,),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
      deleteUserTask(taskItem);
      setState(() {
        fetchTasksList();
      });
      }
  ); 

  AlertDialog alert = AlertDialog(
    title: const Text("Confirmation Alert!"),
    content: const Text("Do you still want to proceed with the action."),
    actions: [
      okButton,
      cancelButton,
    ],
  );  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

   
@override
  void initState() {
    fetchTasksList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Icon(
              Icons.notifications_active_outlined,
              size: 35,
            ),
            SizedBox(
              width: 7,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Image.asset(
                'images/avatar.png',
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
        drawer: DataFunction.customMenuDrawer(context),
        
         body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                ' Welcome To\n Task Manager!',
                style: ThemeStyling.welcomeTitle,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(' What are you doing Today!'),
              ),
        
              /**
             * Added a a custom Widget of SearchBar
             */
              SearchBarWidget(),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    ' Task List!',
                    style: ThemeStyling.welcomeTitle,
                  ),
                  ],
              ),
              const SizedBox(height: 10,),         
              FutureBuilder<List>(
                        future: QuickeyDB.getInstance!<TaskSchema>()?.all,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
              return Column(
                children: [
                  SingleChildScrollView(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, i) {
                    // Task item = snapshot.data![i];                  
                    return GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(snapshot.data!.length, (index) {
                          return Card(
                            color: Colors.blue[50],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 
                                 Text(
                                  'Title: ${snapshot.data![index].taskName}',
                                  style: ThemeStyling.taskCardTitle,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                
                                 Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Deadline: '),
                                    Text('${snapshot.data![index].endDate}'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.edit_document,
                                      size: 25,
                                    ),
                                    InkWell(
                                      onTap: ()=> showAlertDialog(context, snapshot.data![index]),
                                      child: const Icon(
                                        Icons.delete_outline_rounded,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: ElevatedButton(
                                //       style: ElevatedButton.styleFrom(
                                //           shape: RoundedRectangleBorder(
                                //               borderRadius:
                                //                   BorderRadius.circular(15))),
                                //       onPressed: () {},
                                //       child: const Text(
                                //         'Complete a Task',
                                //         textAlign: TextAlign.center,
                                //       )),
                                // )
                              ],
                            ),
                          );
                        }));}),
                  )
                ]);
                          }
                          return const Center(child: CircularProgressIndicator());
                          }
                          )



              // Visibility(
              //   visible: itemCounter == 12? false: true,
              //   child: Column(
              //     children: [
              //               Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         ' YesterDay\'s Task!',
              //         style: ThemeStyling.welcomeTitle,
              //       ),
              //       InkWell(
              //         onTap: (){
              //           setState(() {
              //             if(itemCounter ==2){
              //               setState(() {
              //                 itemCounter = 12;
              //               });
              //             }else{
              //               setState(() {
              //                 itemCounter =2;
              //               });
              //             }
              //           });
                
              //         },
              //         child: Text( itemCounter == 2 ? ' see all >': 'Hide ^')),
              //     ],
              //   ),
              //   TaskCardWidget()
                
              //     ],
              //   ),
              // )
            
            ],
          ),
        ));
  }
}
