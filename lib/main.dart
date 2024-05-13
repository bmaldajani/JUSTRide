import 'package:flutter/material.dart';
import 'package:flutter_scooter_rent_app/scooter_details_screen.dart';
import 'Scooter.dart';
import 'custom_elevated_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  Scooter scooter = Scooter();
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade400),
        useMaterial3: true,
        fontFamily: 'Roboto', // Set font family to Roboto
      ),
      home: const MyHomePage(title: 'JUSTRide Scooter Page'),
      routes: {
        '/scooter_details_screen': (context) => OrderScooterPage(
          scooterId: scooter.id,
          battery: scooter.batteryLevel,
          location: scooter.location,
        ),
      },
    );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedScooter;

  final List<String> _scooters = [
    'Scooter 1',
    'Scooter 2',
    'Scooter 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: _selectedScooter,
              onChanged: (value) {
                setState(() {
                  _selectedScooter = value;
                });
              },
              items: _scooters.map((scooter) {
                return DropdownMenuItem<String>(
                  value: scooter,
                  child: Text(scooter),
                );
              }).toList(),
            ),
            CustomElevatedButton(
              onPressed: () {
                if (_selectedScooter!= null) {
                  Navigator.pushNamed(context, '/scooter_details_screen');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select a scooter'),
                    ),
                  );
                }
              },
              child: const Text('Go to Scooter Details Screen'),
            ),
          ],
        ),
      ),
    );
  }
}