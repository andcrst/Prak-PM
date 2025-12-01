import 'package:flutter/material.dart';

Widget menuList(title, image) => Container(
  width: 372,
  height: 58,
  padding: EdgeInsets.symmetric(horizontal: 24),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        offset: Offset(0, 4),
        blurRadius: 4,
        color: Colors.black.withOpacity(0.24),
      ),
    ],
  ),
  child: Row(
    children: [
      Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xff3A87AB).withOpacity(.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(image),
      ),
      SizedBox(width: 5),
      Expanded(
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      Icon(Icons.keyboard_arrow_right_rounded),
    ],
  ),
);
