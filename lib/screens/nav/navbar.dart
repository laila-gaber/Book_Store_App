import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:v_care_clinic/core/font.dart';
import 'package:v_care_clinic/screens/Books_screen/view/Books_screen.dart';
import 'package:v_care_clinic/screens/Cart_screen/view/Cart_screen.dart';
import 'package:v_care_clinic/screens/Fav_screen/view/Fav_screen.dart';
import 'package:v_care_clinic/screens/Home_screen/view/home_screen.dart';
import 'package:v_care_clinic/screens/Profile_screen/view/User_Profile_Screen.dart';
import '../../core/app_colors.dart';

class Nav extends StatefulWidget {
   Nav({Key?key}):super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;
  List<Widget> _pages=<Widget>[
    HomeScreen() ,// Dummy pages
    BooksScreen(),
    FavScreen(),
    CartScreen(),
    UserProfileScreen(),
  ];
  void _onpagechange(int index)
  {
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _pages.elementAt(_currentIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home,), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bookOpen), label: 'Books'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heartbeat), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cartPlus), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidUserCircle), label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        onTap: _onpagechange,
        backgroundColor: secondaryColor,
        fixedColor: mainColor,
        elevation: 0,
        unselectedItemColor: Colors.black.withOpacity(0.5),
      ),
    );
  }
}
