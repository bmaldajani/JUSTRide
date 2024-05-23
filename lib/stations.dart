import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Scooter {
  final String name;

  Scooter(this.name);
}

class Station {
  final String name;
  final List<Scooter> scooters;

  Station(this.name, this.scooters);
}

class MyApp extends StatelessWidget {
  final List<Station> stations = [
    Station("Station PH", [Scooter("Scooter 1"), Scooter("Scooter 2"), Scooter("Scooter 3")]),

    Station("Station N", [Scooter("Scooter 1"), Scooter("Scooter 2"), Scooter("Scooter 3")]),

    Station("Station D", [Scooter("Scooter 1"), Scooter("Scooter 2"), Scooter("Scooter 3")]),

    Station("Station M Medicine", [Scooter("Scooter 1"), Scooter("Scooter 2"), Scooter("Scooter 3")]),


    Station("Station M Engineering", [Scooter("Scooter 1"), Scooter("Scooter 2"), Scooter("Scooter 3")]),


    Station("Station A", [Scooter("Scooter 1"), Scooter("Scooter 2"), Scooter("Scooter 3")]),

    Station("Station C", [Scooter("Scooter 1"), Scooter("Scooter 2"), Scooter("Scooter 3")]),

    Station("Station Mall", [Scooter("Scooter 1"), Scooter("Scooter 2"), Scooter("Scooter 3")]),

    Station("Station Library", [Scooter("Scooter 1"), Scooter("Scooter 2"), Scooter("Scooter 3")]),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Station List'),
          backgroundColor: const Color.fromARGB(255, 41, 87, 124),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color.fromARGB(255, 158, 196, 228), Color.fromARGB(255, 158, 230, 233)],
              stops: [0.5, 1.0],
            ),
          ),
          child: ListView.builder(
            itemCount: stations.length,
            itemBuilder: (context, index) {
              return StationWidget(station: stations[index]);
            },
          ),
        ),
      ),
    );
  }
}

class StationWidget extends StatelessWidget {
  final Station station;

  StationWidget({required this.station});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (hovering) {
        if (hovering) {
          // Mouse is hovering
          print('Mouse is hovering');
        } else {
          // Mouse is not hovering
          print('Mouse is not hovering');
        }
      },
      child: ExpansionTile(
        title: Text(
          station.name,
          style: TextStyle(
            color: Color.fromARGB(255, 29, 139, 235), // Set the text color to blue
          ),
        ),
        children: station.scooters.map((scooter) => ScooterWidget(scooter: scooter)).toList(),
      ),
    );
  }
}

class ScooterWidget extends StatelessWidget {
  final Scooter scooter;

  ScooterWidget({required this.scooter});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(scooter.name),
      // You can add more functionality or UI elements here for each scooter
    );
  }
}
