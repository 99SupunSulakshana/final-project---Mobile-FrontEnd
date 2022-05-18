// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height * .45,
              decoration: const BoxDecoration(
                  color: Colors.purple,
                  image: DecorationImage(
                    image: AssetImage("assets/images/png01.png"),
                    fit: BoxFit.fitWidth,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
