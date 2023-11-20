import 'package:flutter/material.dart';
import 'package:travellapp/account_page.dart';
import 'package:travellapp/chart_page.dart';
import 'package:travellapp/home_page.dart';
import 'package:travellapp/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = const [
    HomePage(),
    SearchPage(),
    ChartPage(),
    AccountPage(),
  ];
  int currentPageIndex = 0; 
  void onPageChange(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onPageChange,
        currentIndex: currentPageIndex,
        elevation: 0,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.6),
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        // selectedFontSize: 0,
        // unselectedFontSize: 0,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Chart',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
          ),
        ],
      )
    );
  }
}