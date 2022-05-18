// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class DashBoardCustom extends StatefulWidget {
  const DashBoardCustom({Key? key}) : super(key: key);

  @override
  State<DashBoardCustom> createState() => _DashBoardCustomState();
}

class _DashBoardCustomState extends State<DashBoardCustom> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height * 0.45,
              decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  image: DecorationImage(
                      image: AssetImage("assets/images/png01.png"))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    width: 40.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.more_horiz_outlined),
                      onPressed: () {},
                    ),
                  ),
                ),
                Text(
                  "Hi\nSupun",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 3.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: "Search Here",
                        icon: Icon(Icons.search),
                        border: InputBorder.none),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    children: <Widget>[
                      CategoryCard(
                        title: "Recommandation",
                        Img: "assets/images/png01.png",
                        press: () {},
                      ),
                      CategoryCard(
                        title: "Recommandation",
                        Img: "assets/images/png01.png",
                        press: () {},
                      ),
                      CategoryCard(
                        title: "Recommandation",
                        Img: "assets/images/png01.png",
                        press: () {},
                      ),
                      CategoryCard(
                        title: "Recommandation",
                        Img: "assets/images/png01.png",
                        press: () {},
                      ),
                      CategoryCard(
                        title: "Recommandation",
                        Img: "assets/images/png01.png",
                        press: () {},
                      ),
                      CategoryCard(
                        title: "Recommandation",
                        Img: "assets/images/png01.png",
                        press: () {},
                      ),
                      CategoryCard(
                        title: "Recommandation",
                        Img: "assets/images/png01.png",
                        press: () {},
                      ),
                      CategoryCard(
                        title: "Recommandation",
                        Img: "assets/images/png01.png",
                        press: () {},
                      ),
                    ],
                  ),
                )
              ]),
            ),
            
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 80,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              GestureDetector(

              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String Img;
  final String title;
  final void Function()? press;
  const CategoryCard({
    Key? key,
    required this.Img,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        height: 100.0,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17.0,
              spreadRadius: -23,
              color: Colors.grey,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Image(
                    image: AssetImage(Img),
                  ),
                  const Spacer(),
                  Text(title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 10.0))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
 