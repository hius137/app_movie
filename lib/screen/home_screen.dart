import 'package:app_movie/apis/api_service.dart';
import 'package:app_movie/model/entity/movie_entity.dart';
import 'package:app_movie/screen/detail_screen.dart';
import 'package:app_movie/utils/app_image.dart';
import 'package:app_movie/widget/buttons.dart';
import 'package:app_movie/widget/custom_thumbnail.dart';
import 'package:app_movie/widget/custom_ur_movie.dart';
import 'package:app_movie/widget/text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = '97b7e81bbacb764ede3dc7212818e246';
  List<MovieEntity>? listPopularMovie = [];
  List<MovieEntity>? listUCMovie = [];
  int currentIndexThumbnail = 0;
  int currentIndexUR = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    listPopularMovie = await requestPopularMovie();
    if (listPopularMovie != null) {
      setState(() {
        isLoading = false;
      });
    }
    listUCMovie = await requestUCMovie();
    if (listUCMovie != null) {
      setState(() {
        isLoading = false;
      });
    }
  }


  Widget slideThumbnailMoive(List<MovieEntity> listPopularMovie) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          height: 141,
          enlargeCenterPage: true,
          onPageChanged: (index, choise) {
            setState(() {
              currentIndexThumbnail = index;
            });
          }),
      itemCount: listPopularMovie.length,
      itemBuilder: (context, index, realIndex) {
        return CustomThumbnailMovie(
            imageMovie: listPopularMovie[index].posterPath.toString(),
            nameMovie: listPopularMovie[index].title.toString());
      },
    );
  }

  Widget dotTSlide() {
    return AnimatedSmoothIndicator(
      activeIndex: currentIndexThumbnail,
      count: listPopularMovie!.length,
      effect: const ColorTransitionEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: Color(0xFF738CD1),
        dotColor: Color(0xFF4C6191),
      ),
    );
  }

  Widget slideURMovie(List<MovieEntity> listUCMovie) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          height: 214,
          enlargeCenterPage: false,
          viewportFraction: 0.4,
          onPageChanged: (index, choise) {
            setState(() {
              currentIndexUR = index;
            });
          }),
      itemCount: listUCMovie.length,
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                      nameMovie: '',
                      imageMovie: listUCMovie[index].posterPath.toString())),
            );
          },
          child: CustomURMovie(
            imageMovie: listUCMovie[index].posterPath.toString(),
          ),
        );
      },
    );
  }

  Widget dotURSlide() {
    return AnimatedSmoothIndicator(
      activeIndex: currentIndexUR,
      count: listUCMovie!.length,
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF2C5776), Color(0xFF4E4376)])),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(left: 54, right: 63),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hello, ",
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const TextHeader(text: 'Jane!'),
                      ],
                    ),
                    Image(image: AssetImage(AppImage.icNotification)),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50, right: 50),
                padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 20),
                decoration: BoxDecoration(
                    color: const Color(0xFF4F688F),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white30, width: 1),
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage(AppImage.icSearch)),
                        const SizedBox(width: 20),
                        Text(
                          'Search',
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 18,
                            color: const Color(0xFFA2AEC3),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 45,
                      decoration: const BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.white30, width: 1))),
                    ),
                    const SizedBox(width: 17),
                    Image(
                      image: AssetImage(AppImage.icMic),
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
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : slideThumbnailMoive(listPopularMovie!),
              const SizedBox(height: 17),
              Center(child: dotTSlide()),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons(icon: AppImage.icGenres, text: 'Genres'),
                  Buttons(icon: AppImage.icTvseries, text: 'TV series'),
                  Buttons(icon: AppImage.icMovies, text: 'Movies'),
                  Buttons(icon: AppImage.icTheatre, text: 'In Theatre'),
                ],
              ),
              const SizedBox(height: 26),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: const TextHeader(text: 'Upcoming releases'),
              ),
              const SizedBox(height: 15),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : slideURMovie(listUCMovie!),
              const SizedBox(height: 17.29),
              Center(child: dotURSlide()),
            ],
          ),
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
            icon: SvgPicture.asset(AppImage.icTicket),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImage.icAccount),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImage.icShuffle),
            label: '',
          ),
        ],
      ),
    );
  }
}
