import 'package:flutter/material.dart';
import 'package:ukl_flutter/homescreen/cinema_page.dart'; // Import CinemaPage
import 'homecontentpage.dart'; // Import HomeContentPage
import 'booking_page.dart'; // Import BookingPage
import 'movie_page.dart'; // Import MoviePage
import '../widgets/bottom_navbar.dart'; // Import BottomNavbar

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Track the currently selected tab

  // Function to handle navigation on tab tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of pages for navigation
    final List<Widget> _pages = [
      HomeContentPage(), // Home content page
      BookingPage(), // Booking page
      MoviePage(selectedIndex: 2, onItemTapped: _onItemTapped), // Movie page
      CinemaPage(
          onItemTapped: _onItemTapped), // Cinema page (passing onItemTapped)
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      // Show the current page based on the selected index
      body: _pages[_selectedIndex],
      // Bottom navigation bar for tab navigation
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped:
            _onItemTapped, // Pass the function to handle tab selection
      ),
    );
  }
}
