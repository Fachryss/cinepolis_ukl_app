import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;

  const StarRating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    int fullStars = rating ~/ 2; // Calculate full stars
    bool hasHalfStar = (rating % 2) >= 1; // Determine half star

    // Add full stars
    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(
        Icons.star,
        color: Color.fromARGB(255, 233, 116, 7),
        size: 20,
      ));
    }

    // Add half star
    if (hasHalfStar) {
      stars.add(const Icon(
        Icons.star_half,
        color: Color.fromARGB(255, 233, 116, 7),
        size: 20,
      ));
    }

    // Add empty stars to make total 5
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);
    for (int i = 0; i < emptyStars; i++) {
      stars.add(const Icon(
        Icons.star_border,
        color: Color.fromARGB(255, 233, 116, 7),
        size: 20,
      ));
    }

    return Row(children: stars);
  }
}
