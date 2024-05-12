import 'dart:async';

import 'package:flutter/material.dart';

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

  void _endRide() {
    _timerInstance?.cancel();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => EndRideScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scooter Booked'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Scooter ${widget.code} has been booked.'),
            SizedBox(height: 20),
            Text("Time  : " + _formatTime()),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _endRide,
              child: Text('End Ride'),
            ),
          ],
        ),
      ),
    );
  }
}

class EndRideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('End Ride'),
      ),
      body: Center(
        child: Text('Ride has been ended.'),
      ),
    );
  }
}