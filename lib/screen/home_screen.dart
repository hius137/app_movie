import 'package:app_movie/model/movie_model.dart';
import 'package:app_movie/utils/app_image.dart';
import 'package:app_movie/utils/custom_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel> listMovie = List.of(dataImage);
  PageController controller = PageController();
  int currentPage = 0;

  Widget slide(List<MovieModel> listMovie) {
    return Container(
      height: 141,
      margin: EdgeInsets.only(left: 50, right: 50),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(30),
      ),
      child: PageView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: controller,
        itemCount: listMovie.length,
        itemBuilder: (context, index) {
          return CustomThumbnail(
            imageMovie: listMovie[index].image.toString(),
            nameMovie: listMovie[index].name.toString(),
          );
        },
        onPageChanged: (int page) {
          currentPage = page;
        },
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
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF2C5776), Color(0xFF4E4376)])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(left: 64, right: 63),
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
                            Text(
                              'Jane!',
                              style: GoogleFonts.beVietnamPro(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.notifications,
                          color: Colors.white30,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50, right: 50),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF4F688F),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Colors.white30,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Search',
                              style: GoogleFonts.beVietnamPro(
                                fontSize: 18,
                                color: Colors.white30,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.mic,
                          color: Colors.white30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Text(
                      'Most Popular',
                      style: GoogleFonts.beVietnamPro(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 15),
                  /*Container(
                    margin: EdgeInsets.only(left: 50, right: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                            image: AssetImage(AppImage.holw),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 26,
                          child: Text(
                            'DeadPool 2',
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
                    ),
                  ),*/
                  slide(listMovie),
                  SizedBox(height: 17),
                  // Row(
                  //   children: [
                  //     Container(
                  //       width: 8,
                  //       height: 8,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(4),
                  //         color: Color(0xFF4B6392),
                  //       ),
                  //     ),
                  //     SizedBox(width: 2),
                  //     Container(
                  //       width: 8,
                  //       height: 8,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(4),
                  //         color: Color(0xFF7092d3),
                  //       ),
                  //     ),
                  //     SizedBox(width: 2),
                  //     Container(
                  //       width: 8,
                  //       height: 8,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(4),
                  //         color: Color(0xFF4B6392),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 50, right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 69,
                          height: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                colors: [Color(0xFF536D96), Color(0xFF5E89A4)]),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(AppImage.ic_genres),
                              ),
                              Text(
                                'Genres',
                                style: GoogleFonts.beVietnamPro(
                                  fontSize: 9,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 69,
                          height: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                colors: [Color(0xFF536D96), Color(0xFF5E89A4)]),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(AppImage.ic_tvseries),
                              ),
                              Text(
                                'TV series',
                                style: GoogleFonts.beVietnamPro(
                                  fontSize: 9,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 69,
                          height: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                colors: [Color(0xFF536D96), Color(0xFF5E89A4)]),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(AppImage.ic_movies),
                              ),
                              Text(
                                'Movies',
                                style: GoogleFonts.beVietnamPro(
                                  fontSize: 9,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 69,
                          height: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                colors: [Color(0xFF536D96), Color(0xFF5E89A4)]),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(AppImage.ic_theatre),
                              ),
                              Text(
                                'In Theatre',
                                style: GoogleFonts.beVietnamPro(
                                  fontSize: 9,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Text(
                      'Upcoming releases',
                      style: GoogleFonts.beVietnamPro(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
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
              backgroundColor: Color(0xFF3e4c76),
              icon: SvgPicture.asset(AppImage.ic_homescreen),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: SvgPicture.asset(AppImage.ic_favorite),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImage.ic_ticket), label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImage.ic_account), label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImage.ic_shuffle), label: ''),
        ],
      ),
    );
  }
}
