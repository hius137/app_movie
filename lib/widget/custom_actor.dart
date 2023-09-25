import 'package:app_movie/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomActor extends StatelessWidget {
  final String imageActor;
  final String nameActor;
  final String characterActor;

  const CustomActor({
    super.key,
    required this.imageActor,
    required this.nameActor,
    required this.characterActor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image(
            width: 60,
            height: 70,
            image: NetworkImage(imageActor.isEmpty ? AppImage.imgActor1 : 'https://image.tmdb.org/t/p/w500/$imageActor'),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 9),
        SizedBox(
          width: 40,
          height: 20,
          child: Text(
            nameActor,
            textAlign: TextAlign.center,
            style: GoogleFonts.beVietnamPro(
              color: Colors.white,
              fontSize: 8,
            ),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          characterActor,
          textAlign: TextAlign.center,
          style: GoogleFonts.beVietnamPro(
            color: const Color.fromRGBO(255, 255, 250, 0.50),
            fontSize: 8,
          ),
        )
      ],
    );
  }
}
