// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class ImageCard {
  final List<Widget> fContents = <Widget>[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/image1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
              bottom: 10,
              child: Text(
                "첫번째 배경사진",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/image2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
              bottom: 10,
              child: Text(
                "두번째 배경사진",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 200,
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/image3.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Positioned(
              bottom: 10,
              child: Text(
                "세번째 배경사진",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          SizedBox(
            width: 150,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/image1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
              bottom: 10,
              child: Text(
                "네번째 배경사진",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
        ],
      ),
    ),
    Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 150,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/image2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Positioned(
            bottom: 10,
            child: Text(
              "다섯번째 배경사진",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
      ],
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          SizedBox(
            width: 150,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/image3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            bottom: 10,
            child: Text(
              "여섯번째 배경사진",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          SizedBox(
            width: 150,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/image1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            bottom: 10,
            child: Text(
              "7번째 배경사진",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  ];
}
