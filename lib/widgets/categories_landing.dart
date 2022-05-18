import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "", "text": "Bill"},
      {"icon": "", "text": "Pay"},
      {"icon": "", "text": "Bill"},
      {"icon": "", "text": "Bill"},
      {"icon": "", "text": "Bill"},
      {"icon": "", "text": "Bill"},
    ];
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...List.generate(
                categories.length,
                (index) => CtegoryCard(
                      //icon: categories[index]["icon"],
                      text: categories[index]["text"],
                      press: () {},
                    ),
                    )
          ],
        ),
      ),
    );
  }
}

class CtegoryCard extends StatelessWidget {
  const CtegoryCard({Key? key, required this.text, required this.press})
      : super(key: key);

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 50.0,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                //child: SvgPicture.asset(icon),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
