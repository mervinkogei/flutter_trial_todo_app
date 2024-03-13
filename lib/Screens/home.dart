import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trial_todo_app/Utils/data_function.dart';
import 'package:trial_todo_app/widgets/searchBar_widget.dart';

import '../Utils/textStyling.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent
            //color set to transperent or set your own color
            ));

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
        drawer: Drawer(),
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Today\'s Task!',
                    style: ThemeStyling.welcomeTitle,
                  ),
                  Text(' see all >'),
                ],
              ),
              const SizedBox(height: 10,),
              Column(
                children: [
                  GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(2, (index) {
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
                                  Icon(
                                    Icons.bookmark_add_outlined,
                                    size: 40,
                                  ),
                                  InkWell(
                                    onTap: ()=> DataFunction.showAlertDialog(context),
                                    child: Icon(
                                      Icons.delete_outline_rounded,
                                      color: Colors.red,
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
                                    child: Text(
                                      'Complete a Task',
                                      textAlign: TextAlign.center,
                                    )),
                              )
                            ],
                          ),
                        );
                      })),
                ],
              )
            ],
          ),
        ));
  }
}
