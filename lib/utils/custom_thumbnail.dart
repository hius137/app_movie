import 'package:app_movie/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThumbnail extends StatelessWidget {
  final String imageMovie;
  final String nameMovie;
  const CustomThumbnail({super.key,required this.imageMovie, required this.nameMovie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image(
              image: AssetImage(imageMovie),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 26,
          child: Text(
            nameMovie,
            style: GoogleFonts.beVietnamPro(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 26.49,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF5C518),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 3),
                  child: Image(
                    image: AssetImage(AppImage.ic_imdb),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  child: Text(
                    '8.5',
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
