import 'package:ben_demistim/model/user.dart';
import 'package:ben_demistim/widgets/components/drawer.dart';
import 'package:ben_demistim/widgets/pages/topicsPage.dart';
import 'package:ben_demistim/widgets/pages/entryPage.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{

  int _currentIndex = 0;
  List<Widget> _pages;
  @override
  void initState() {
    _pages = [
      Entries(),
      Topics(),
      HomePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        drawer: DrawerWidget(user: User(5, "sinan", "cCc", "1232", "sinanylmaz@gmail.com", 8, 3),),
        backgroundColor: Colors.blue,
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "başlıklar",
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text("bildirimler"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text("profil"),
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}
