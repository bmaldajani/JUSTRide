import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_scooter_rent_app/app_styles.dart';
import 'package:flutter_scooter_rent_app/size_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

import 'RatingDialog.dart';
import 'end_ride_screen.dart';

class ScooterBookedScreen extends StatefulWidget {
  final String? code;

  const ScooterBookedScreen({Key? key, required this.code}) : super(key: key);

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
    _timerInstance = Timer.periodic(Duration(seconds: 1), (Timer timer) {
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
          onSubmitted: (rating) {
            // Handle the submitted rating here
            Navigator.pop(context);
          },
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
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.6,
                width: double.infinity,
                child: Stack(
                  children: [

                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        height: SizeConfig.screenHeight! * 0.2,
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            tileMode: TileMode.clamp,
                            colors: [
                              kWhite,
                              kWhite,
                              kWhite.withOpacity(0.7),
                              kWhite.withOpacity(0.4),
                              kWhite.withOpacity(0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 147,
                child: Row(
                  children: [
                    Container(
                      height: 147,
                      width: SizeConfig.screenWidth! * 0.85,
                      margin: const EdgeInsets.only(
                        left: 24,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: kPadding8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius10),
                        border: Border.all(
                          color: kGrey,
                          width: 1,
                        ),
                        color: kWhite,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '    Scooter ${widget.code} has been booked.',
                            style: kWorkSansBold.copyWith(
                              color: kUltraViolet66,
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 2,
                          ),
                          Text(
                            "    Time  : " + _formatTime(),
                            style: kWorkSansMedium.copyWith(
                              color: kLightUltraVioletAA,
                              fontSize:
                              SizeConfig.blockSizeHorizontal! * 2.9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 2.5,
              ),
              InkWell(
                onTap: _endRide,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kPadding24,
                    vertical: kPadding16,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: kPadding24,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius12),
                    color: kYellowXanthousFF,
                  ),
                  child: Center(
                    child: Text(
                      'End Ride',
                      style: kWorkSansSemibold.copyWith(
                        color: kWhite,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
