// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CAROUSELIMAGE extends StatefulWidget {
  const CAROUSELIMAGE({super.key});

  @override
  State<CAROUSELIMAGE> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CAROUSELIMAGE> {
  final List<String> imageUrls = [
    'https://www.planetware.com/wpimages/2020/07/cambodia-top-places-to-visit-kampot.jpg',
    'https://www.planetware.com/wpimages/2020/07/cambodia-top-places-to-visit-kampot.jpg',
    'https://www.planetware.com/wpimages/2020/07/cambodia-top-places-to-visit-kampot.jpg',
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 300.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Container(
                    // width: 400,
                    // height: 400,
                    // margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(url),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text('Irence Red VedVet'),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageUrls.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => {},
              child: Container(
                width: 50.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  shape: BoxShape.rectangle,
                  color: _currentIndex == entry.key ? Colors.blue : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
