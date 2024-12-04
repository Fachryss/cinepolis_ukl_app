import 'package:flutter/material.dart';
import 'package:ukl_flutter/homescreen/cinema_page.dart'; // Import CinemaPage

class MoviePage extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  MoviePage({required this.selectedIndex, required this.onItemTapped});

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedLocation = 'Jakarta'; // Default location value

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_tabChanged);
  }

  @override
  void dispose() {
    _tabController.removeListener(_tabChanged);
    _tabController.dispose();
    super.dispose();
  }

  // Sync Bottom Navigation Bar with Tab change
  void _tabChanged() {
    if (_tabController.indexIsChanging) {
      widget.onItemTapped(
          _tabController.index == 0 ? 2 : 3); // Switch to Movie or Cinema
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Dropdown for location
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.location_on,
                    color: Colors.blue[900]), // Location Icon
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _selectedLocation, // Default location
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  underline: Container(), // Remove underline
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLocation = newValue!; // Update the location
                    });
                  },
                  items: <String>['Jakarta', 'Surabaya', 'Bali', 'Bandung']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Cinema or Movie',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          // TabBar and TabBarView for Movies and Cinema
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Movie'),
                Tab(text: 'Cinema'),
              ],
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              indicatorWeight: 3,
            ),
          ),

          // Content starts directly below the TabBar
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Content for Movie Tab
                ListView(
                  children: [
                    _movieRow(
                      'A Man Called Otto',
                      '13+',
                      'assets/images/movie1.png',
                      'Moana 2',
                      'SU',
                      'assets/images/movie2.png',
                    ),
                    _movieRow(
                      'Wild Robot',
                      'SU',
                      'assets/images/movie3.png',
                      'Starting 5',
                      '13+',
                      'assets/images/movie4.png',
                    ),
                  ],
                ),
                // Content for Cinema Tab (uses CinemaPage)
                CinemaPage(onItemTapped: widget.onItemTapped),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Movie row with two images side by side
  Widget _movieRow(String title1, String rating1, String imagePath1,
      String title2, String rating2, String imagePath2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        children: [
          _moviePoster(title1, rating1, imagePath1),
          const SizedBox(width: 10), // Space between posters
          _moviePoster(title2, rating2, imagePath2),
        ],
      ),
    );
  }

  // Widget for a single Movie poster with image and information
  Widget _moviePoster(String title, String rating, String imagePath) {
    return Expanded(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Align content to center
        children: [
          // Movie Poster (adjusted to show fully with aspect ratio)
          AspectRatio(
            aspectRatio: 2 / 3, // Common aspect ratio for movie posters
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover, // Ensures the full poster is displayed
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Movie Title (centered)
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center, // Center the text
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Rating Text (centered)
          Text(
            rating,
            textAlign: TextAlign.center, // Center the text
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),

          // Buy Now Button (increased size with white text)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 5, 48, 98), // Dark blue button
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Buy Now',
                style: TextStyle(
                  color: Colors.white, // White text
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
