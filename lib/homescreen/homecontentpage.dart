import 'package:flutter/material.dart';
import 'package:ukl_flutter/widgets/carousel_demo.dart';
import 'package:ukl_flutter/widgets/header_widget.dart';
import 'package:ukl_flutter/widgets/recommendation_section.dart';
import 'package:ukl_flutter/widgets/section_title.dart';
import 'package:ukl_flutter/widgets/upcoming_movies_section.dart';
import 'package:ukl_flutter/widgets/promotion_section.dart';

class HomeContentPage extends StatelessWidget {
  HomeContentPage({Key? key}) : super(key: key);

  final List<String> nowShowingImages = [
    "assets/images/movie1.png",
    "assets/images/movie2.png",
    "assets/images/movie3.png",
    "assets/images/movie4.png",
  ];

  final List<String> upcomingMoviesImages = [
    "assets/images/movie2.png",
    "assets/images/movie3.png",
    "assets/images/movie1.png",
    "assets/images/movie2.png",
    "assets/images/movie3.png",
  ];

  final List<String> promotionsImages = [
    "assets/images/promo1.jpg",
    "assets/images/promo2.jpg",
    "assets/images/promo3.jpg",
  ];

  final List<String> recommendationsImages = [
    "assets/images/film3.jpg",
    "assets/images/film2.jpg",
    "assets/images/film1.jpg",
    "assets/images/film2.jpg",
    "assets/images/film.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Header
            const HeaderWidget(),

            const SizedBox(height: 24),

            // Recommendation Section
            RecommendationSection(recommendations: recommendationsImages),

            const SizedBox(height: 24),

            // Now Showing
            const SectionTitle(title: "Now Showing"),
            CarouselDemo(imageList: nowShowingImages),

            const SizedBox(height: 24),

            // Upcoming Movies
            const SectionTitle(title: "Upcoming Movies"),
            UpcomingMoviesSection(imageList: upcomingMoviesImages),

            const SizedBox(height: 24),

            // Promotion
            const SectionTitle(title: "Promotion"),
            PromotionSection(imageList: promotionsImages),
          ],
        ),
      ),
    );
  }
}
