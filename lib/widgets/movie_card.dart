import 'package:flutter/material.dart';
import 'package:ukl_flutter/widgets/star_rating.dart'; // Import star rating widget

class MovieCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String ageRating;
  final String genre;
  final double rating;

  const MovieCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.ageRating,
    required this.genre,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            // Movie details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  ageRating,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  genre,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                // Rating with stars
                Row(
                  children: [
                    StarRating(rating: rating),
                    const SizedBox(width: 8),
                    Text(
                      "$rating",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 233, 116, 7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
