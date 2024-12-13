import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class ImageViewer {
  FlutterCarouselController buttonCarouselController = FlutterCarouselController();
  ImageViewer(BuildContext context, List<String> images, {int initialIndex = 0}) {
    showGeneralDialog(
      barrierColor: Colors.black,
      transitionDuration: const Duration(milliseconds: 500),
      barrierDismissible: true,
      barrierLabel: 'Barrier',
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Hero(
            tag: 'IMAGEVIEW',
            child: StatefulBuilder(
              builder: (context, setState) {
                int currentIndex = initialIndex;
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Scaffold(
                    backgroundColor: Colors.black,
                    body: Stack(
                      children: [
                        FlutterCarousel(
                          options: FlutterCarouselOptions(
                            initialPage: initialIndex,
                            controller: buttonCarouselController,
                            enableInfiniteScroll: false,
                            height: MediaQuery.of(context).size.height,
                            viewportFraction: 1.0,
                            slideIndicator: CircularSlideIndicator(
                              slideIndicatorOptions: const SlideIndicatorOptions(
                                currentIndicatorColor: Colors.deepPurple, // Warna indikator saat ini
                                indicatorBackgroundColor: Colors.cyan, // Warna latar belakang indikator
                              ),
                            ),
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                          items: images.map((image) {
                            return Center(
                              child: Image.asset(
                                image,
                                fit: BoxFit.contain,
                              ),
                            );
                          }).toList(),
                        ),
                        Positioned(
                          top: 25,
                          right: 25,
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: MediaQuery.of(context).size.height / 2 - 25,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                             buttonCarouselController.previousPage(
                                  duration: const Duration(milliseconds: 300), curve: Curves.linear
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 25,
                          top: MediaQuery.of(context).size.height / 2 - 25,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward, color: Colors.white),
                            onPressed: () {
                              buttonCarouselController.nextPage(
                                  duration: const Duration(milliseconds: 300), curve: Curves.linear
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}