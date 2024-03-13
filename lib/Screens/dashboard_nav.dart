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

/// Add Navigators keys for the Bottom Navigation Items
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
        backgroundColor: Colors.white,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(20),
            child: SizedBox(
          height: 90,
          child: BottomNavigationBar(
            selectedFontSize: 13,
            unselectedFontSize: 13,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            items:  const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon:  Icon(Icons.home),
                activeIcon: Icon(Icons.home, color: Colors.white,),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                activeIcon:  Icon(Icons.task, color: Colors.white,),
                label: 'Tasks',
              ),
             BottomNavigationBarItem(
                icon: Icon(Icons.person),
                activeIcon: Icon(Icons.person, color: Colors.white,),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedItemColor: Colors.grey,
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
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
          ],
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
