import 'package:app_movie/utils/app_image.dart';
import 'package:app_movie/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_sheet/sliding_sheet.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.nameMovie, required this.imageMovie});
  final String nameMovie;
  final String imageMovie;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        headerBuilder: (context, sheet){
          return Container(
            decoration: const BoxDecoration(
              gradient:
              LinearGradient(colors: [Color(0xFF2C5776), Color(0xFF4E4376)],),
            ),
            height: 20,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: 30,
                  height: 2,
                  color: const Color(0xFFB5C2DD),
                ),
              ),
            ),
          );
        },
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.5, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Center(
          child: Stack(
            children: [
              Image(
                image: AssetImage(AppImage.thor),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 30,
                left: 30,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(
                    AppImage.ic_back,
                  ),
                ),
              ),
            ],
          ),
        ),
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            decoration: const BoxDecoration(
                gradient:
                LinearGradient(colors: [Color(0xFF2C5776), Color(0xFF4E4376)],),
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Thor',
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromRGBO(166, 161, 224, 0.30),
                        ),
                        child: Text(
                          'Action',
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Container(
                        padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromRGBO(166, 161, 224, 0.30),
                        ),
                        child: Text(
                          '16+',
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Container(
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
                                '8.5',
                                style: GoogleFonts.beVietnamPro(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Image(image: AssetImage(AppImage.ic_share)),
                      const SizedBox(width: 10),
                      Image(image: AssetImage(AppImage.ic_favorite)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'When the Dark Elves attempt to plunge the universe into'
                        ' darkness, Thor must embark on a perilous and personal'
                        ' journey that will reunite him with. When the Dark '
                        'Elves attempt to plunge the universe into darkness,'
                        ' Thor must embark on a perilous and personal journey'
                        ' that will reunite him with',
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 12,
                      color: const Color.fromRGBO(255, 255, 255, 0.75),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const TextHeader(text: 'Cast'),
                      const Spacer(),
                      Text(
                        'See All',
                        style: GoogleFonts.beVietnamPro(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
