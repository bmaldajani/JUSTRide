import 'package:flutter/material.dart';

const kSpacing = SizedBox(height: 16);

class CheckOtherScootersScreen extends StatelessWidget {
  const CheckOtherScootersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Other Scooters'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          'Check Other Scooters',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}