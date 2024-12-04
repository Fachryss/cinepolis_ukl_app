import 'package:flutter/material.dart';

class MyBookingHeader extends StatelessWidget {
  final VoidCallback onClockPressed;
  final bool hasActiveBooking;

  const MyBookingHeader({
    Key? key,
    required this.onClockPressed,
    this.hasActiveBooking = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50), // Added space to push "My Booking" lower
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "My Booking",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.access_time,
                size: 30,
                color: Colors.black,
              ),
              onPressed: onClockPressed,
            ),
          ],
        ),
        const SizedBox(height: 10), // Space between "My Booking" and next text
        // Only show this text if no active booking
        if (!hasActiveBooking)
          const Text(
            "There's no active booking",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
      ],
    );
  }
}
