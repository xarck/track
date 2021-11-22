import 'package:flutter/material.dart';
import 'package:track/utils/dimension.dart';
import 'package:track/views/home.dart';
import 'package:track/views/library.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [Home(), Library()];
  _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: getSize(context).height,
        width: getSize(context).width,
        child: Center(
          child: IndexedStack(
            index: _selectedIndex,
            children: _widgetOptions,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Library", icon: Icon(Icons.library_music))
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red,
      ),
    );
  }
}
