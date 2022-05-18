// ignore_for_file: avoid_unnecessary_containers, prefer_final_fields, sized_box_for_whitespace, unused_field, import_of_legacy_library_into_null_safe, avoid_print, prefer_const_constructors, unused_local_variable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/model/Customer.dart';
import 'package:final_project/screens/TaskPages/service_dash.dart';
import 'package:final_project/utils/routers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    final europeanCountries = [
      'Albania',
      'Andorra',
      'Armenia',
      'Austria',
      'Azerbaijan',
      'Belarus',
      'Belgium',
      'Bosnia and Herzegovina',
      'Bulgaria',
      'Croatia'
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepPurple,
          title: Text(
            "All in ONE",
            textDirection: TextDirection.ltr,
            style: GoogleFonts.pacifico(fontSize: 20.0),
          ),
          leading: IconButton(
            icon: Icon(Icons.menu_open),
            onPressed: () {},
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.notifications_active)),
            IconButton(onPressed: () {
              PageNavigator(ctx: context)
                                .nextPage(page: const DashBoardCustom());
            }, icon: Icon(Icons.list_alt)),
          ],
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("assets/images/png07.png"),
                  fit: BoxFit.fitHeight)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    viewportFraction: 1.0,
                    onPageChanged: (index, carouselReason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    enlargeCenterPage: true,
                  ),
                  items: imgList
                      .map((item) => Container(
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(item,
                                          fit: BoxFit.cover, width: 1000.0),
                                      Positioned(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(200, 0, 0, 0),
                                                Color.fromARGB(0, 0, 0, 0)
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 20.0),
                                          child: Text(
                                            '${imgList.indexOf(item)} Mobitel',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ))
                      .toList(),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  alignment: Alignment.topRight,
                  child: Text(
                    'More...',
                    style: GoogleFonts.raleway(
                        fontSize: 15.0,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map(
                    (entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 7.0,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.deepPurple)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    },
                  ).toList(),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text.rich(TextSpan(
                    text: "A Valentine Surprise\n",
                    style: TextStyle(color: Colors.white),
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      TextSpan(
                        text: "Get 20% OFF Packages",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 12.0, bottom: 10.0, right: 12.0),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Let\'s Special Service!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 144.0,
                  margin: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 10.0),
                  child: Column(children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 8.0),
                            padding: EdgeInsets.only(left: 8.0),
                            height: 64.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border:
                                    Border.all(color: Colors.white, width: 1.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(.5),
                                      blurRadius: 20.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(5.0, 5.0)),
                                ]),
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.payment,
                                  color: Colors.deepPurple,
                                  size: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 5.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Text(
                                          'Payments',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'All Networks',
                                          style: TextStyle(fontSize: 10.0),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            padding: const EdgeInsets.only(left: 8.0),
                            height: 64.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                border:
                                    Border.all(color: Colors.white, width: 1.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(.5),
                                      blurRadius: 20.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(5.0, 5.0)),
                                ]),
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.payment,
                                  color: Colors.deepPurple,
                                  size: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 5.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Text(
                                          'Payments',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'All Networks',
                                          style: TextStyle(fontSize: 10.0),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 8.0),
                            padding: EdgeInsets.only(left: 8.0),
                            height: 64.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(.5),
                                    blurRadius: 20.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(5.0, 5.0)),
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                              border:
                                  Border.all(color: Colors.white, width: 1.0),
                            ),
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.payment,
                                  color: Colors.deepPurple,
                                  size: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 5.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Text(
                                          'Payments',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'All Networks',
                                          style: TextStyle(fontSize: 10.0),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            padding: const EdgeInsets.only(left: 8.0),
                            height: 64.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(.5),
                                    blurRadius: 20.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(5.0, 5.0)),
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                              border:
                                  Border.all(color: Colors.white, width: 1.0),
                            ),
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.payment,
                                  color: Colors.deepPurple,
                                  size: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 5.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Text(
                                          'Payments',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'All Networks',
                                          style: TextStyle(fontSize: 10.0),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),

                // Popular Section.............
                Container(
                  margin: const EdgeInsets.only(
                      left: 12.0, bottom: 10.0, right: 12.0),
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        'Let\'s Popular Destination!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'More..',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 140,
                  child: ListView.builder(
                      itemCount: populars.length,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          // elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            height: 140,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(.5),
                                    blurRadius: 20.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(5.0, 5.0)),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      populars[index].image,
                                      height: 60.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    populars[index].name,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                // Mobile Section
                Container(
                  margin: const EdgeInsets.only(
                      left: 12.0, bottom: 10.0, right: 12.0, top: 10.0),
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        'Let\'s Popular Destination!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'More..',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 181,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 16.0),
                    itemCount: populars.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 16.0),
                        width: 220.0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    height: 104,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              populars[index].image),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Positioned(
                                    child: IconButton(
                                      icon: Icon(Icons.favorite),
                                      onPressed: () {},
                                      color: Colors.red,
                                    ),
                                    right: 0,
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    left: 8,
                                    child: Text(
                                      populars[index].country,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                populars[index].country,
                                maxLines: 3,
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 7.0),
                              )
                            ]),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
