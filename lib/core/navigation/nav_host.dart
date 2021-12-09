import 'package:flutter/material.dart';
import 'package:tandem/core/presentation/widgets/app_bottom_navigation_bar.dart';
import 'package:tandem/features/chat/presentation/screens/people_screen.dart';
import 'package:tandem/features/home/presentation/screens/home_screen.dart';
import 'package:tandem/features/profile/presentation/screens/profile_screen.dart';

class NavHost extends StatefulWidget {
  NavHost({this.subRout, Key? key}) : super(key: key);

  Widget? subRout;

  @override
  State<NavHost> createState() => _NavHostState();
}

class _NavHostState extends State<NavHost> {
  int currentTab = 0;

  Widget _getRoute(int index, Widget? subRout) {
    Widget body = SizedBox();

    switch (index) {
      case 0:
        body = subRout ??
            ProfileScreen();
        break;
      case 1:
        body = PeopleScreen();
        break;
      case 2:
        body = HomeScreen();
        break;

    }

    return body;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          child: _getRoute(currentTab, widget.subRout)),
      bottomNavigationBar: AppBottomNavigationBar(
        onTap: (index) {
          print('CUR INDEX $index');
          switch (index) {
            case 0:
              setState(() {
                currentTab = 0;
              });
              break;
            case 1:
              setState(() {
                currentTab = 1;
              });
              break;
            case 2:
              setState(() {
                currentTab = 2;
              });
              break;
            default:
          }
        },
      ),
    );
  }
}


class NavHost1 extends StatefulWidget {
  NavHost1({this.subRout, Key? key}) : super(key: key);

  Widget? subRout;

  @override
  State<NavHost> createState() => _NavHostState1();
}

class _NavHostState1 extends State<NavHost> {
  int currentTab = 0;

  Widget _getRoute(int index, Widget? subRout) {

    Widget body = SizedBox();


    switch (index) {
      case 0:
            body = ProfileScreen();
        break;
      case 1:
        body = HomeScreen();
        break;
      case 2:
        body = HomeScreen();
        break;
      default:
    }

    return body;

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          child: _getRoute(currentTab, widget.subRout)),
      bottomNavigationBar: AppBottomNavigationBar(
        onTap: (index) {
          print('CUR INDEX $index');
          switch (index) {
            case 0:
              setState(() {
                currentTab = 0;
              });
              break;
            case 1:
              setState(() {
                currentTab = 1;
              });
              break;
            case 2:
              setState(() {
                currentTab = 2;
              });
              break;
            default:
          }
        },
      ),
    );
  }
}
