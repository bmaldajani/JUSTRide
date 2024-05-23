import 'package:flutter/material.dart';
import 'package:flutter_scooter_rent_app/app_styles.dart';
import 'package:flutter_scooter_rent_app/scooter.dart';
import 'package:flutter_scooter_rent_app/scooter_details_screen.dart';
import 'package:flutter_scooter_rent_app/size_config.dart';
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
        Scooter(id: 'scooter1', location: 'M4', batteryLevel: 80),
        Scooter(id: 'scooter2', location: 'M4', batteryLevel: 70),
      ],
      location: Location(name: 'Station 1 Location', latitude: 37.7749, longitude: -122.4194),
    ),
    Station(
      id: '2',
      name: 'Station 2',
      scooters: [
        Scooter(id: 'scooter3', location: 'M5', batteryLevel: 90),
        Scooter(id: 'scooter4', location: 'M5', batteryLevel: 60),
      ],
      location: Location(name: 'Station 2 Location', latitude: 37.7859, longitude: -122.4364),
    ),
  ];

  Station? _selectedStation;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: kWhite,
        body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(kPadding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kPadding18),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Select a Station',
                  border: OutlineInputBorder(),
                ),
                value: _selectedStation,
                onChanged: (Station? station) {
                  setState(() {
                    _selectedStation = station;
                  });
                },
                items: _stations.map((station) {
                  return DropdownMenuItem(
                    value: station,
                    child: Text(station.name),
                  );
                }).toList(),
              ),
              if (_selectedStation != null)
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _selectedStation!.scooters.length,
                  itemBuilder: (context, index) {
                    Scooter scooter = _selectedStation!.scooters[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderScooterPage(scooter: scooter),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Icon(Icons.electric_scooter),
                        title: Text('Scooter ${scooter.id}'),
                        subtitle: Text('Location: ${scooter.location}'),
                        trailing: Text('Battery: ${scooter.batteryLevel}%'),
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