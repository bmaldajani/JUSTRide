import 'package:flutter/material.dart';
import 'package:myapp/start_ride_screen.dart';

import 'check_other_scooters_screen.dart';
import 'custom_elevated_button.dart';
import 'main.dart';

const kSpacing = SizedBox(height: 16);

class ScooterDetailsScreen extends StatelessWidget {
  final String scooterId;
  final int battery;
  final String location;

  const ScooterDetailsScreen({
    super.key,
    required this.scooterId,
    required this.battery,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 23, 61, 93)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ScooterDetailsSection(
              scooterId: scooterId,
              battery: battery,
              location: location,
            ),
            kSpacing,
            _ActionButtonsSection(),
          ],
        ),
      ),
    );
  }
}

class _ScooterDetailsSection extends StatelessWidget {
  final String scooterId;
  final int battery;
  final String location;

  const _ScooterDetailsSection({
    required this.scooterId,
    required this.battery,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/scooter_details_background.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Scooter ID: $scooterId',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Roboto'),
                ),
              ),
              kSpacing,
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Battery: $battery%',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Roboto'),
                ),
              ),
              kSpacing,
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Scooter location: $location',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontFamily: 'Roboto'),
                ),
              ),
              const SizedBox(height: 200),
            ],
          ),
        ],
      ),
    ) ;
  }
}class _ActionButtonsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QRScannerScreen(),
              ),
            );
          },
          backgroundColor: Colors.green,
          child: const Text('Start Ride'),
        ),
        kSpacing,
        CustomElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(title: 'JUSTRide Scooter Page'),
              ),
            );
          },
          backgroundColor: Colors.blueAccent,
          child: const Text('Check Other Scooters'),
        ),
      ],
    );
  }
}