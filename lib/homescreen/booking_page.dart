import 'package:flutter/material.dart';
import 'package:ukl_flutter/widgets/my_booking_header.dart';
import 'package:ukl_flutter/widgets/movie_card.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // My Booking Header
            MyBookingHeader(
              onClockPressed: () {
                // Logic for clock icon
              },
            ),
            const SizedBox(height: 20),

            // Movie Cards
            MovieCard(
              imagePath: "assets/images/movie1.png",
              title: "The Amazing Movie",
              ageRating: "D 17+",
              genre: "Action, Adventure",
              rating: 8.5,
            ),
            const SizedBox(height: 16),
            MovieCard(
              imagePath: "assets/images/movie2.png",
              title: "Another Great Film",
              ageRating: "D 13+",
              genre: "Drama, Romance",
              rating: 7.5,
            ),
          ],
        ),
      ),
    );
  }
}
