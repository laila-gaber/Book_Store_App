import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v_care_clinic/screens/Books_screen/view/Books_screen.dart';
import 'package:v_care_clinic/screens/Cart_screen/view/Cart_screen.dart';
import 'package:v_care_clinic/screens/Fav_screen/view/Fav_screen.dart';
import 'package:v_care_clinic/screens/Home_screen/view/home_screen.dart';
import 'package:v_care_clinic/screens/Profile_screen/view/Profile_screen.dart';

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
    ProfileScreen(),
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
              icon: Icon(Icons.home,), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_sharp), label: 'Books'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        onTap: _onpagechange,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black.withOpacity(0.5),
      ),
      /*
      bottomNavigationBar:BottomAppBar(
        color: Colors.white,
       // shape: CircularNotchedRectangle(),
       // notchMargin: 0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.home,),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  HomeScreen(),
                      ),
                    );
                  },
                ),
                Text(
                  'Home',
                  style: TextStyle(fontSize: 12,),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.menu_book_sharp,),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BooksScreen(),
                      ),
                    );

                  },
                ),
                Text(
                  'Books',
                  style: TextStyle(fontSize: 12,),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_rounded, color: Colors.red),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  FavScreen(),
                      ),
                    );

                  },
                ),
                Text(
                  'Favourite',
                  style: TextStyle(fontSize: 12,),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart,),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ),
                    );
                  },
                ),
                Text(
                  'Cart',
                  style: TextStyle(fontSize: 12, color: HexColor('#174068')),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.account_box,),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                ),
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 12, color: HexColor('#174068')),
                ),
              ],
            ),
          ],
        ),
      ),*/
    );
  }
}
