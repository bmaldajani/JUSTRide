import 'package:flutter/material.dart';
import 'package:flutter_scooter_rent_app/size_config.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'app_styles.dart';
import 'scooter_booked_screen.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  bool _isScanning = false;

  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text('Unlock the scooter'),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
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
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 2.5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isScanning = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kYellowXanthousFF,
                            padding: const EdgeInsets.symmetric(
                              horizontal: kPadding24,
                              vertical: kPadding16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(kBorderRadius12),
                            ),
                          ),
                          child: Text(
                            'Scan the QR code to Unlock the Scooter',
                            style: kWorkSansSemibold.copyWith(
                              color: kWhite,
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            ),
                          ),
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
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: kGrey,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: kUltraViolet66,
                                      width: 1,
                                    ),
                                  ),
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
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kYellowXanthousFF,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: kPadding24,
                                    vertical: kPadding16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(kBorderRadius12),
                                  ),
                                ),
                                child: Text(
                                  'Unlock Scooter!',
                                  style: kWorkSansSemibold.copyWith(
                                    color: kWhite,
                                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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