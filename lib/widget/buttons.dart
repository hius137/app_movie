import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttons extends StatelessWidget {
  final String icon;
  final String text;

  const Buttons({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 69,
      height: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
            colors: [Color(0xFF536D96), Color(0xFF5E89A4)]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(icon),
          ),
          Text(
            text,
            style: GoogleFonts.beVietnamPro(
              fontSize: 9,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
