import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:trial_todo_app/Utils/data_function.dart';
import 'package:trial_todo_app/widgets/searchBar_widget.dart';
import 'package:trial_todo_app/widgets/taskCard_widget.dart';

import '../Utils/textStyling.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 var itemCounter = 2;

@override
  void initState() {
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
                    ' Today\'s Task!',
                    style: ThemeStyling.welcomeTitle,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        if(itemCounter ==2){
                          setState(() {
                            itemCounter = 12;
                          });
                        }else{
                          setState(() {
                            itemCounter =2;
                          });
                        }
                      });

                    },
                    child: Text( itemCounter == 2 ? ' see all >': 'Hide ^')),
                ],
              ),
              const SizedBox(height: 10,),
              Container(
                height: itemCounter != 12? 180: 350,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            children: List.generate(itemCounter, (index) {
                              return Card(
                                color: Colors.blue[50],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(
                                          Icons.bookmark_add_outlined,
                                          size: 40,
                                        ),
                                        InkWell(
                                          onTap: ()=> DataFunction.showAlertDialog(context),
                                          child: const Icon(
                                            Icons.delete_outline_rounded,
                                            color: Colors.red,
                                            size: 25,
                                          ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                  borderRadius:
                                                      BorderRadius.circular(15))),
                                          onPressed: () {},
                                          child: const Text(
                                            'Complete a Task',
                                            textAlign: TextAlign.center,
                                          )),
                                    )
                                  ],
                                ),
                              );
                            })),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: itemCounter == 12? false: true,
                child: Column(
                  children: [
                            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' YesterDay\'s Task!',
                      style: ThemeStyling.welcomeTitle,
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(itemCounter ==2){
                            setState(() {
                              itemCounter = 12;
                            });
                          }else{
                            setState(() {
                              itemCounter =2;
                            });
                          }
                        });
                
                      },
                      child: Text( itemCounter == 2 ? ' see all >': 'Hide ^')),
                  ],
                ),
                TaskCardWidget()
                
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
