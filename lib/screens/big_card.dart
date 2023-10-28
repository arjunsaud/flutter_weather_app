import 'dart:ui';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key});

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
                children: const [
                  Text(
                    "300 ° F",
                    style: TextStyle(fontSize: 32, letterSpacing: 1),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Icon(
                    Icons.cloud,
                    size: 32,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Rain",
                    style: TextStyle(fontSize: 20),
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
