import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [
            Text(
              "00:00",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.cloud,
              size: 32,
            ),
            SizedBox(
              height: 10,
            ),
            Text("120.11")
          ],
        ),
      ),
    );
  }
}

class AdditionalCard extends StatelessWidget {
  const AdditionalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: const [
          Icon(
            Icons.water_drop,
            size: 32,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Text",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text("120.11")
        ],
      ),
    );
  }
}
