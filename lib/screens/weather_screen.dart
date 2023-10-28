import 'package:flutter/material.dart';

import 'big_card.dart';
import 'small_card.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 1),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              print("refresh");
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            BigCard(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Weather Forecast",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  SmallCard(
                    icon: Icons.sunny,
                    time: "00:00",
                    temperature: "26",
                  ),
                  SmallCard(
                    icon: Icons.sunny,
                    time: "03:00",
                    temperature: "32",
                  ),
                  SmallCard(
                    icon: Icons.sunny,
                    time: "06:00",
                    temperature: "24",
                  ),
                  SmallCard(
                    icon: Icons.sunny,
                    time: "09:00",
                    temperature: "20",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Additional Information",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                AdditionalCard(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: "91",
                ),
                AdditionalCard(
                  icon: Icons.air,
                  label: "Wind Speed",
                  value: "91",
                ),
                AdditionalCard(
                  icon: Icons.beach_access,
                  label: "Pressure",
                  value: "91",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
