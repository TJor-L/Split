import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/groups.dart';
import 'screens/scan.dart';
import 'screens/notification.dart';
import 'screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bottom Navigation',
      theme: ThemeData(    // 整体theme的参数
        primarySwatch: Colors.grey,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(  // 底部导航栏的theme参数
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: MainScreen(), // 主屏幕
    );
  }
}

class MainScreen extends StatefulWidget {    // 主屏幕， stateful widget， 用于切换不同的屏幕
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {    // 渲染主屏幕的state
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[    //主屏幕的所有页面
    HomeScreen(),
    GroupScreen(),
    ScanScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(Icons.home, 'Home', 0),
          _buildBottomNavigationBarItem(Icons.group, 'Groups', 1),
          _buildBottomNavigationBarItem(Icons.qr_code_scanner, 'Scan', 2),
          _buildBottomNavigationBarItem(Icons.notifications, 'Notifications', 3),
          _buildBottomNavigationBarItem(Icons.person, 'Profile', 4),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[300] : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
      label: label,
    );
  }
}
