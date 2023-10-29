import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/secrets.dart';

import 'big_card.dart';
import 'small_card.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    String city = 'Kathmandu';
    try {
      final resp = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$city&APPID=$apiKey'),
      );
      final data = jsonDecode(resp.body);
      if (data['cod'] != '200') {
        throw 'An Error Occurred Fetching Data';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

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
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final data = snapshot.data;
          final currentTemp =
              (data?['list'][0]['main']['temp'] - 273.15).toStringAsFixed(2);
          final currentWeather = data?['list'][0]['weather'][0]['main'];

          final pressure = data?['list'][0]['main']['pressure'];
          final humidity = data?['list'][0]['main']['humidity'];
          final speed = data?['list'][0]['wind']['speed'];

          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                BigCard(
                  temp: currentTemp,
                  weather: currentWeather,
                  icon: currentWeather == 'Clouds' || currentWeather == "Rain"
                      ? Icons.cloud
                      : Icons.sunny,
                ),
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
                //this make add 8 card even all cards are not shown
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //we don't need bracket in for loop, if there are more cards like SmallCard we can just type for (int i = 1; i <= 8; i++) ...[ array of widgets] // this destructure all widgets
                //       for (int i = 1; i <= 8; i++)
                //         SmallCard(
                //           icon: Icons.device_thermostat,
                //           time: (data?['list'][i]['dt']).toString(),
                //           temperature:
                //               (data?['list'][i]['main']['temp'] - 273.15)
                //                   .toStringAsFixed(2)
                //                   .toString(),
                //         ),
                //     ],
                //   ),
                // ),
                ListView.builder(itemBuilder: (context, index) {}),
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
                  children: [
                    AdditionalCard(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: '$humidity',
                    ),
                    AdditionalCard(
                      icon: Icons.air,
                      label: "Wind Speed",
                      value: '$speed',
                    ),
                    AdditionalCard(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: '$pressure',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
