import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cart.dart';
import 'package:flutter_application_1/screens/favorite.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/profile.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  const BottomNavBar({super.key, required this.initialIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        _navigateToRoute(context, '/home', HomeScreen());
        break;
      case 1:
        _navigateToRoute(
            context,
            '/favorite',
            Favorite(
                favoriteProducts:
                    shoes.where((product) => product.isFavorite).toList()));
        break;
      case 2:
        _navigateToRoute(context, '/mybag', MyCart());
        break;
      case 3:
        _navigateToRoute(context, '/myaccount', MyProfile());
        break;
    }
  }

  void _navigateToRoute(context, String routeName, Widget screen) {
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    bool routeExists = currentRouteName == routeName;

    if (routeExists) {
      Navigator.popUntil(context, ModalRoute.withName(routeName));
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
          settings: RouteSettings(name: routeName),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: _selectedIndex == 0 ? Colors.green : Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: _selectedIndex == 1 ? Colors.green : Colors.black,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: _selectedIndex == 2 ? Colors.green : Colors.black,
            ),
            label: 'My Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              color: _selectedIndex == 3 ? Colors.green : Colors.black,
            ),
            label: 'Account',
          ),
        ]);
  }
}
