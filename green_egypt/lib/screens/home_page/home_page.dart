import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:green_egypt/screens/home_page/home_screen/home_screen.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> pages = [HomeScreen(), TransactionPage(), MorePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        curve: Curves.linear,
        iconSize: 20.sp,
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text("home"),
              textAlign: TextAlign.center,
              activeColor:
                  currentIndex == 0 ? Color(0xFF9E9ED1) : Colors.black),
          BottomNavyBarItem(
              icon: Icon(Icons.bookmarks_outlined),
              title: Text("Transactions"),
              textAlign: TextAlign.center,
              activeColor:
                  currentIndex == 1 ? Color(0xFFFFCA38) : Colors.black),
          BottomNavyBarItem(
              icon: Icon(Icons.more_horiz_outlined),
              title: Text("more"),
              textAlign: TextAlign.center,
              activeColor:
                  currentIndex == 2 ? Color(0xFFFF7870) : Colors.black),
        ],
        onItemSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: SafeArea(
        child: pages[currentIndex],
      ),
    );
  }
}
