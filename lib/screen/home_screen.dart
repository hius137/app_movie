import 'package:app_movie/model/movie_model.dart';
import 'package:app_movie/utils/app_image.dart';
import 'package:app_movie/widget/custom_thumbnail.dart';
import 'package:app_movie/widget/text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel> listMovie = List.of(dataImage);
  int currentIndex = 0;

  Widget slide(List<MovieModel> listMovie) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          height: 141,
          enlargeCenterPage: true,
          onPageChanged: (index, choise) {
            setState(() {
              currentIndex = index;
            });
          }),
      itemCount: listMovie.length,
      itemBuilder: (context, index, realIndex) {
        return CustomThumbnail(
            imageMovie: listMovie[index].image.toString(),
            nameMovie: listMovie[index].name.toString());
      },
    );
  }

  Widget dotSlide() {
    return AnimatedSmoothIndicator(
      activeIndex: currentIndex,
      count: listMovie.length,
      effect: const ColorTransitionEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: Color(0xFF738CD1),
        dotColor: Color(0xFF4C6191),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF2C5776), Color(0xFF4E4376)])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(left: 64, right: 63),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Hello, ',
                              style: GoogleFonts.beVietnamPro(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            const TextHeader(text: 'Jane!'),
                          ],
                        ),
                        const Icon(
                          Icons.notifications,
                          color: Colors.white30,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 50, right: 50),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4F688F),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Colors.white30,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              'Search',
                              style: GoogleFonts.beVietnamPro(
                                fontSize: 18,
                                color: Colors.white30,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.mic,
                          color: Colors.white30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: const TextHeader(text: 'Most Popular'),
                  ),
                  const SizedBox(height: 15),
                  slide(listMovie),
                  const SizedBox(height: 17),
                  Center(child: dotSlide()),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 50, right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
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
                                image: AssetImage(AppImage.icGenres),
                              ),
                              const TextSmall(text: 'Genres'),
                            ],
                          ),
                        ),
                        Container(
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
                                image: AssetImage(AppImage.icTvseries),
                              ),
                              const TextSmall(text: 'TV series'),
                            ],
                          ),
                        ),
                        Container(
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
                                image: AssetImage(AppImage.icMovies),
                              ),
                              const TextSmall(text: 'Movies'),
                            ],
                          ),
                        ),
                        Container(
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
                                image: AssetImage(AppImage.icTheatre),
                              ),
                              const TextSmall(text: 'In Theatre'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: const TextHeader(text: 'Upcoming releases'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: const Color(0xFF3e4c76),
              icon: SvgPicture.asset(AppImage.icHomescreen),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: SvgPicture.asset(AppImage.icFavorite),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImage.icTicket), label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImage.icAccount), label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImage.icShuffle), label: ''),
        ],
      ),
    );
  }
}
