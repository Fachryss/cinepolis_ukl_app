import 'package:flutter/material.dart';

class CinemaPage extends StatefulWidget {
  final Function(int) onItemTapped; // Callback for Bottom Navigation

  CinemaPage({required this.onItemTapped});

  @override
  _CinemaPageState createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedLocation = 'Jakarta'; // Default location value

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    _tabController.addListener(_tabChanged);
  }

  @override
  void dispose() {
    _tabController.removeListener(_tabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _tabChanged() {
    if (_tabController.indexIsChanging) {
      widget.onItemTapped(_tabController.index == 0 ? 2 : 3);
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
                Icon(Icons.location_on, color: Colors.black), // Location Icon
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
          const SizedBox(height: 16),

          // TabBar and TabBarView for Movies and Cinema
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'Movies'),
                      Tab(text: 'Cinema'),
                    ],
                    indicatorColor: Colors.blue,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView(
                        children: [
                          _movieCard('Bila Esok Ibu Tiada'),
                          _movieCard('Wicked'),
                          _movieCard('Gladiator'),
                          _movieCard('Avengers: Endgame'),
                        ],
                      ),
                      ListView(
                        children: [
                          _cinemaCard(
                              'Cinema 1: The Amazing Show', '2 km', 'IMAX'),
                          _cinemaCard('Cinema 2: The Great Adventure', '5 km',
                              'Standard'),
                          _cinemaCard('Cinema 3: Movie Night Special', '10 km',
                              'Luxury'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Movie card
  Widget _movieCard(String title) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title),
        subtitle: Text('Details of the movie'),
      ),
    );
  }

  // Widget for Cinema card
  Widget _cinemaCard(String name, String distance, String type) {
    return Card(
      margin: const EdgeInsets.symmetric(
          vertical: 8, horizontal: 16), // Added margin for spacing
      elevation: 4, // Added shadow for the "box" effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
        side: BorderSide(
            color: Colors.grey.shade300,
            width: 1), // Border color and thickness
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Padding inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            // Row for distance with location icon
            Row(
              children: [
                Icon(Icons.location_on,
                    size: 18, color: Colors.blue), // Location icon
                const SizedBox(width: 8), // Space between icon and text
                Text('Distance: $distance'),
              ],
            ),
            const SizedBox(height: 8),
            // Row for type with movie type icon
            Row(
              children: [
                Icon(Icons.movie, size: 18, color: Colors.blue), // Type icon
                const SizedBox(width: 8), // Space between icon and text
                Text('Type: $type'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
