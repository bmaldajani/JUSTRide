import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_scooter_rent_app/app_styles.dart';
import 'package:flutter_scooter_rent_app/scooter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'RatingDialog.dart';

class ScooterBookedScreen extends StatefulWidget {
  final Scooter scooter;

  const ScooterBookedScreen({super.key, required this.scooter});

  @override
  _ScooterBookedScreenState createState() => _ScooterBookedScreenState();
}

class _ScooterBookedScreenState extends State<ScooterBookedScreen> {
  int _timer = 0;
  Timer? _timerInstance;

  String _formatTime() {
    final minutes = _timer ~/ 60;
    final seconds = _timer % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timerInstance?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timerInstance = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _timer++;
      });
    });
  }

  void _showRatingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return RatingDialog(
          onSubmitted: (rating, station) {
// Handle the submitted rating here
            Navigator.pop(context);
          },
          stations: [],
        );
      },
    );
  }

  void _endRide() {
    _timerInstance?.cancel();
    _showRatingDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                child: Stack(
                  children: [
                    FlutterMap(
                      options: const MapOptions(
                        initialCenter: LatLng(32.493971, 35.992492),
                        initialZoom: 16,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: const LatLng(32.493971, 35.992492),
                              width: 60,
                              height: 60,
                              child: SvgPicture.asset(
                                'assets/icon-scooter-marker-pin.svg',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              kBlue,
                              kBlue.withOpacity(0.5),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Time: ${_formatTime()}',
                                style: kWorkSansMedium.copyWith(
                                    color: kWhite, fontSize: 20),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: kBlue,
                                  backgroundColor: kWhite,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(kBorderRadius10),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: kPadding12,
                                      horizontal: kPadding24),
                                  textStyle:
                                      kWorkSansBold.copyWith(fontSize: 20),
                                ),
                                onPressed: _endRide,
                                child: const Text('End Ride'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(),
              Padding(
                padding: const EdgeInsets.all(kPadding24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${"JUST"} ${"2 Pro"}',
                          style: kWorkSansBold.copyWith(
                              color: kUltraViolet66, fontSize: 20),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/img-scooter-demo.png',
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
