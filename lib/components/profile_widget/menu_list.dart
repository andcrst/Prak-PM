import 'package:flutter/material.dart';

Widget menuList({
  required String title,
  required String image,
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap ?? () {}, // <-- onTap bisa kosong / null tanpa error
    borderRadius: BorderRadius.circular(12),
    child: Container(
      width: 372,
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
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
              color: const Color(0xff3A87AB).withOpacity(.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(image),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Icon(Icons.keyboard_arrow_right_rounded),
        ],
      ),
    ),
  );
}
