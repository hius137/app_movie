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
        border:  Border.all(color: Colors.white54),
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
            colors: [const Color(0xFF536D96).withOpacity(0.7), const Color(0xFF5E89A4).withOpacity(0.7)]),
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
