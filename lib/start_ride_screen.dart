import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'scooter_booked_screen.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  bool _isScanning = false;

  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unlock the scooter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isScanning
                ? MobileScanner(
              onDetect: (barcode, args) {
                setState(() {
                  _codeController.text = barcode.rawValue ?? '';
                  _isScanning = false;
                  _navigateToScooterBookedScreen(barcode.rawValue);
                });
              },
            )
                : Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isScanning = true;
                    });
                  },
                  child: const Text('Scan the QR code to Unlock the Scooter'),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _codeController,
                        decoration: const InputDecoration(
                          labelText: 'or you can enter the code manually',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a the code:';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isScanning = false;
                              _navigateToScooterBookedScreen(_codeController.text);
                            });
                          }
                        },
                        child: const Text('Unlock Scooter!'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScooterBookedScreen(String? code) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScooterBookedScreen(code: code),
      ),
    );
  }
}