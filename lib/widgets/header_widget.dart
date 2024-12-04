import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row for Header with location dropdown and icons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left: Dropdown button for location selection
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.black),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: 'Jakarta', // Default location
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  underline: Container(), // Remove underline
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  onChanged: (String? newValue) {
                    // Handle location change (optional implementation)
                    // You can implement the logic for changing location here
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

            // Right: Heart, Bell, and Profile Icons
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Heart icon action (example)
                  },
                  icon: const Icon(Icons.favorite_border),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    // Bell icon action (example)
                  },
                  icon: const Icon(Icons.notifications_none),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    // Profile icon action (example)
                  },
                  icon: const Icon(Icons.account_circle),
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),

        // "Hello, Guest" Text
        const SizedBox(height: 16),
        const Text(
          "Hello, Guest",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 8),
        // Subtitle text asking what the user wants to watch
        Text(
          "Kamu mau nonton apa hari ini?",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
