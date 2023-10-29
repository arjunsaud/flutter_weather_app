import 'dart:ui';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  final temp;
  final weather;

  const BigCard({super.key, required this.temp, required this.weather});

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
                    "$temp K",
                    style: const TextStyle(fontSize: 32, letterSpacing: 1),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Icon(
                    Icons.cloud,
                    color: Colors.blue,
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
