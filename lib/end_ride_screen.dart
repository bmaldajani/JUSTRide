import 'package:flutter_scooter_rent_app/RatingDialog.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  final Function(int) onSubmitted;

  const RatingPage({Key? key, required this.onSubmitted}) : super(key: key);

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RatingDialog(
          onSubmitted: widget.onSubmitted,
        ),
      ),
    );
  }
}