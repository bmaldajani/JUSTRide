import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_scooter_rent_app/app_styles.dart';
import 'package:flutter_scooter_rent_app/scooter.dart';
import 'package:flutter_scooter_rent_app/size_config.dart';
import 'package:flutter_scooter_rent_app/start_ride_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

class OrderScooterPage extends StatelessWidget {
  final Scooter scooter;
  const OrderScooterPage({required this.scooter});

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
                      child: Row(
                        children: [
                          SizedBox(
                            height: 126,
                            width: 126,
                            child: Image.asset('assets/img-scooter-demo.png'),
                          ),
                          const SizedBox(
                            height: 107,
                            child: VerticalDivider(
                              color: kGrey,
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Scooter Id: " + scooter.id,
                                  style: kWorkSansBold.copyWith(
                                    color: kUltraViolet66,
                                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                  ),
                                ),
                                Text(
                                  scooter.location,
                                  style: kWorkSansMedium.copyWith(
                                    color: kLightUltraVioletAA,
                                    fontSize:
                                    SizeConfig.blockSizeHorizontal! * 2.9,
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical! * 1,
                                ),
                                const Divider(
                                  color: kGrey,
                                  thickness: 1,
                                  height: 1,
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical! * 1,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icon-energy-green.svg',
                                    ),
                                    SizedBox(
                                      width:
                                      SizeConfig.blockSizeHorizontal! * 1.5,
                                    ),
                                    Text(
                                      'Battery left',
                                      style: kWorkSansMedium.copyWith(
                                        color: kLightUltraVioletAA,
                                        fontSize:
                                        SizeConfig.blockSizeHorizontal! * 2.9,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:SizeConfig.blockSizeVertical! * 0.5,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: scooter.batteryLevel.toString(),
                                    style: kWorkSansBold.copyWith(
                                      color: kUltraViolet66,
                                      fontSize:
                                      SizeConfig.blockSizeHorizontal! * 6,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' percent',
                                        style: kWorkSansMedium.copyWith(
                                          color: kLightUltraVioletAA,
                                          fontSize:
                                          SizeConfig.blockSizeHorizontal! *
                                              3.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QRScannerScreen()),
              );
            },
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
                  'Rent Scooter',
                  style: kWorkSansSemibold.copyWith(
                    color: kWhite,
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  ),
                ),
              ),
            ),
          ),          ]),
        ),
      ),
    );
  }
}