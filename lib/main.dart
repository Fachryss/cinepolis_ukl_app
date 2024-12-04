import 'package:flutter/material.dart';
import 'package:ukl_flutter/authpage/splash_screen.dart';
import 'package:ukl_flutter/homescreen/home_page.dart';
import 'package:ukl_flutter/homescreen/homecontentpage.dart'; // Home Page
import 'package:ukl_flutter/homescreen/booking_page.dart'; // Booking Page
import 'package:ukl_flutter/homescreen/movie_page.dart'; // Movie Page
import 'package:ukl_flutter/homescreen/cinema_page.dart'; // Cinema Page
import 'package:ukl_flutter/widgets/bottom_navbar.dart'; // Bottom Navbar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Start with MainApp
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0; // Track the selected tab

  // Callback function when an item is tapped on BottomNavbar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    // Updated pages list (including HomeContentPage)
    final List<Widget> _pages = [
      HomeContentPage(), // HomeContentPage widget
      BookingPage(), // BookingPage widget
      MoviePage(
        selectedIndex: 2, // Set the initial index to Movie tab
        onItemTapped: _onItemTapped, // Pass the function to MoviePage
      ), // MoviePage widget
      CinemaPage(
        onItemTapped: _onItemTapped, // Pass the function to CinemaPage
      ), // CinemaPage widget
    ];

    return Scaffold(
      body: _pages[_selectedIndex], // Show the selected page
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex, // Pass selected index to BottomNavbar
        onItemTapped:
            _onItemTapped, // Pass the function to handle tab selection
      ),
    );
  }
}
