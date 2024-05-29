import 'package:flutter/material.dart';
import 'package:flutter_scooter_rent_app/app_styles.dart';
import 'package:flutter_scooter_rent_app/scooter_details_screen.dart';
import 'package:flutter_scooter_rent_app/size_config.dart';
import 'package:flutter_scooter_rent_app/scooter.dart';
import 'package:flutter_scooter_rent_app/stations.dart';

import 'location.dart';

class StationsScreen extends StatefulWidget {
  @override
  _StationsScreenState createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen> {
  List<Station> _stations = [
    Station(
      id: '1',
      name: 'Station 1',
      scooters: [
        Scooter(id: 'scooter1', location: 'M4', batteryLevel: 80, stationid: "0"),
        Scooter(id: 'scooter2', location: 'M4', batteryLevel: 70, stationid: "0"),
      ],
      location: Location(name: 'Station 1 Location', latitude: 37.7749, longitude: -122.4194),
    ),
    Station(
      id: '2',
      name: 'Station 2',
      scooters: [
        Scooter(id: 'scooter3', location: 'M5', batteryLevel: 90, stationid: "1"),
        Scooter(id: 'scooter4', location: 'M5', batteryLevel: 60, stationid: "1"),
      ],
      location: Location(name: 'Station 2 Location', latitude: 37.7859, longitude: -122.4364),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Stations',
          style: kWorkSansBold.copyWith(
            color: kUltraViolet66,
            fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kPadding24),
          child: Column(
            children: [
              const SizedBox(height: kPadding16),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _stations.length,
                itemBuilder: (context, index) {
                  Station station = _stations[index];
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius10),
                      border: Border.all(
                        color: kGrey,
                        width: 1,
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: kPadding12),
                    padding: EdgeInsets.all(
                      SizeConfig.blockSizeHorizontal! * 5,
                    ),
                    child: Column(
                      children: [
                        Text(
                          station.name,
                          style: kWorkSansBold.copyWith(
                            color: kUltraViolet66,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          ),
                        ),
                        const SizedBox(height: kPadding12),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: station.scooters.length,
                          itemBuilder: (context, scooterIndex) {
                            Scooter scooter = station.scooters[scooterIndex];
                            return ListTile(
                              leading: Icon(Icons.electric_scooter),
                              title: Text('Scooter ${scooter.id}'),
                              subtitle: Text('Location: ${scooter.location}'),
                              trailing: Text('Battery: ${scooter.batteryLevel}%'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderScooterPage(scooter: scooter),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}