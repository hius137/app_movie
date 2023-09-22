import 'package:app_movie/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThumbnailMovie extends StatelessWidget {
  final String imageMovie;
  final String nameMovie;
  final String imdb;

  const CustomThumbnailMovie(
      {super.key, required this.imageMovie, required this.nameMovie, required this.imdb});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image(
              image: NetworkImage('http://image.tmdb.org/t/p/w500/$imageMovie'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient:
                const LinearGradient(colors: [Color(0xFF121212), Colors.white10],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Positioned(
          width: 200,
          bottom: 15,
          left: 26,
          child: Text(
             nameMovie,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.beVietnamPro(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 26.49,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF5C518),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 3),
                  child: Image(
                    image: AssetImage(AppImage.icImdb),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    imdb,
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 6,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
