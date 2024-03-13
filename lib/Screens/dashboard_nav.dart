import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trial_todo_app/Screens/home.dart';
import 'package:trial_todo_app/Screens/profile.dart';
import 'package:trial_todo_app/Screens/tasks.dart';

class DashBoardScreen extends StatefulWidget {
   final int? currentPageToNavigate;
  const DashBoardScreen({super.key, this.currentPageToNavigate});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class CustomPageRoute extends MaterialPageRoute {
  // ignore: use_super_parameters
  CustomPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}



class _DashBoardScreenState extends State<DashBoardScreen>  with WidgetsBindingObserver{

final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.currentPageToNavigate ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: ClipRRect(
            child: SizedBox(
          height: 100,
          child: BottomNavigationBar(
            selectedFontSize: 13,
            unselectedFontSize: 13,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).primaryColor,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            items:  const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon:  Icon(Icons.home),
                activeIcon: Icon(Icons.home, color: Colors.blue,),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                activeIcon:  Icon(Icons.task, color: Colors.blue,),
                label: 'Tasks',
              ),
             BottomNavigationBarItem(
                icon: Icon(Icons.person),
                activeIcon: Icon(Icons.person, color: Colors.blue,),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.amberAccent,
            onTap: (index) {
              Navigator.pushReplacement(
                  context,
                  CustomPageRoute(
                      builder: (context) =>
                          DashBoardScreen(currentPageToNavigate: index)));
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        )),
        body: Container(
          // decoration: Color.green,
          child: Stack(
            children: [
              _buildOffstageNavigator(0),
              _buildOffstageNavigator(1),
              _buildOffstageNavigator(2),
            ],
          ),
        ),
      );
  }  

  
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const HomeScreen(),
          const TasksScreen(),
          const ProfileScreen(),
        ].elementAt(index);
      },
    };
  }

  
  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
