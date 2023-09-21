import 'package:flutter/material.dart';

class CustomURMovie extends StatelessWidget {
  final String imageMovie;

  const CustomURMovie(
      {super.key, required this.imageMovie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image(
            image: NetworkImage('http://image.tmdb.org/t/p/w500/$imageMovie'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
