import 'dart:ui';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  final temp;
  final weather;
  final icon;

  const BigCard(
      {super.key,
      required this.temp,
      required this.weather,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        //ClipRReact is used to add radius for blur
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          //back drop filter is for blur effect
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "$temp °C",
                    style: const TextStyle(fontSize: 32, letterSpacing: 1),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Icon(
                    icon,
                    size: 32,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "$weather",
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
