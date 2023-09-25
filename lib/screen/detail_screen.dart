import 'package:app_movie/apis/api_service.dart';
import 'package:app_movie/model/entity/actor_entity.dart';
import 'package:app_movie/model/response/detail_movie_response.dart';
import 'package:app_movie/utils/app_image.dart';
import 'package:app_movie/widget/custom_actor.dart';
import 'package:app_movie/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.id});
  final int id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DetailMovieResponse? detailMovieResponse;
  List<Cast> listActor = [];
  bool isLoading = true;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    final response = await requestDetailMovie(widget.id);
    if (response != null) {
      setState(() {
        detailMovieResponse = response;
        isLoading = false;
      });
    }

    listActor = (await requestCreditsMovie(widget.id))!;
      setState(() {});
  }

  Widget slideActor(List<Cast> listActor) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return SizedBox(
          height: 140,
          width: double.infinity,
          child: ListView.separated(
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CustomActor(
                imageActor: listActor[index].profilePath.toString(),
                nameActor: listActor[index].name.toString(),
                characterActor: listActor[index].character.toString(),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 20);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        headerBuilder: (context, sheet) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2C5776), Color(0xFF4E4376)],
              ),
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
          snappings: [0.3, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Center(
          child: Stack(
            children: [
              isLoading
                  ? const CircularProgressIndicator()
                  : Image(
                      image: NetworkImage(
                          'http://image.tmdb.org/t/p/w500/${detailMovieResponse?.posterPath ?? ''}'),
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
                    AppImage.icBack,
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
              gradient: LinearGradient(
                colors: [Color(0xFF2C5776), Color(0xFF4E4376)],
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  Text(
                    detailMovieResponse?.title ?? '',
                    textAlign: TextAlign.center,
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
                        padding: const EdgeInsets.only(
                            left: 10, top: 5, right: 10, bottom: 5),
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
                        padding: const EdgeInsets.only(
                            left: 10, top: 5, right: 10, bottom: 5),
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
                                width: 30,
                                height: 22,
                                image: AssetImage(AppImage.icImdb),
                                fit: BoxFit.cover,
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
                      Image(image: AssetImage(AppImage.icShare)),
                      const SizedBox(width: 10),
                      Image(image: AssetImage(AppImage.icFavorite)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    detailMovieResponse?.overview ?? '',
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
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  height: 500,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                    colors: [Color(0xFF2C5776), Color(0xFF4E4376)],),
                                  ),
                                  child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 2,
                                      crossAxisCount: 5,
                                      mainAxisSpacing: 2,
                                      childAspectRatio: 0.75
                                    ),
                                    itemCount: listActor.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return CustomActor(
                                        imageActor: listActor[index].profilePath ?? "",
                                        nameActor: listActor[index].name ?? "",
                                        characterActor: listActor[index].character ?? "");
                                    },
                                  ),
                                );
                              });
                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  if (listActor != null && listActor.isNotEmpty)
                    slideActor(listActor ?? []),
                ],
              ),
            ),
          );
        },
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
