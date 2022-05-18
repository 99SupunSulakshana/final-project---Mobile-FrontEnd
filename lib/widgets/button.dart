import 'package:final_project/styles/colors.dart';
import 'package:flutter/material.dart';

Widget customButton(
    {VoidCallback? tap,
    bool? status = false,
    String? text = 'Save',
    BuildContext? context}) {
  return GestureDetector(
    onTap: status == true ? null : tap,
    child: Container(
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: status == false ? primaryColor : grey,
          borderRadius: BorderRadius.circular(25)),
      width: MediaQuery.of(context!).size.width,
      child: Text(
        status == false ? text! : 'Please wait...',
        style: TextStyle(color: white, fontSize: 18),
      ),
    ),
  );
}
