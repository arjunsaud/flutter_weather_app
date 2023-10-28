import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final IconData icon;
  final String time;
  final String temperature;

  const SmallCard(
      {super.key,
      required this.icon,
      required this.time,
      required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(temperature)
          ],
        ),
      ),
    );
  }
}

class AdditionalCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const AdditionalCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(value)
      ],
    );
  }
}
