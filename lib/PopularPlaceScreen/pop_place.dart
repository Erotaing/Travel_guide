// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../HomeScreen/hearticon.dart';

class PopularPlace extends StatefulWidget {
  const PopularPlace({super.key});

  @override
  State<PopularPlace> createState() => _PopularPlaceState();
}

class _PopularPlaceState extends State<PopularPlace> {
  static const imageUrl = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk7K0Uj6Zu8hQ9xvYEh_mksep6fwvliQc5FQ&s',
    'https://www.siemreap.net/wp-content/uploads/2018/04/bayon-temple-696x435.jpg.webp',
    'https://whc.unesco.org/uploads/thumbs/news_2162-1200-630-20200910105401.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwWUZ300k5WQPZwu53XFU9LcITpT2z71g0Qg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS82gmZ6aj10MMDV9i2_gRL_20E2r-ASBVkyw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOGRl3L4OXhmDvKoaHAnIh6V1lLnNk7RSklQ&s'
  ];
  static const place = [
    'Tuol Sleng Museum',
    'Bayon Temple',
    'Preah Vihear Temple',
    'Koh Rong',
    'Krong Kep',
    'Wat Phnom'
  ];
  static const province = [
    'Phnom Penh',
    'Siem Reap',
    'Preah Vihear',
    'Sihanoukville',
    'Kep',
    'Phnom Penh'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search App Bar
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue[400],
              ),
              child: Column(
                children: [
                  // Top Bar
                  Padding(
                    padding: EdgeInsets.only(top: 30, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Popular Place',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.notifications_outlined,
                                size: 35,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Notification action
                              },
                            ),
                            Positioned(
                              right: 14,
                              top: 8,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 10,
                                  minHeight: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Search Bar
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 40),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.filter_list),
                        hintStyle: TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Top Places Section
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.center, // Center the cards
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: List.generate(imageUrl.length, (index) {
                    return buildPlaceCard(context, imageUrl[index],
                        place[index], province[index]);
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget buildPlaceCard(
      BuildContext context, String imageUrl, String place, String province) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0, right: 5.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: HeartClickBtn(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place,
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.blue[400],
                        size: 20,
                      ),
                      Text(
                        province,
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          '5.0',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
