import 'package:flutter/material.dart';
import 'package:track/utils/dimension.dart';
import 'package:track/views/home.dart';
import 'package:track/views/library.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    Home(),
    Library(),
  ];
  _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
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
        items: const [
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
