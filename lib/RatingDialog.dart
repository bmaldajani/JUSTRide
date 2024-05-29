import 'package:flutter/material.dart';
import 'package:flutter_scooter_rent_app/history_rides_page.dart';
import 'package:flutter_scooter_rent_app/scooter.dart';
import 'package:flutter_scooter_rent_app/stations.dart';

class RatingDialog extends StatefulWidget {
  final Function(int, String) onSubmitted;
  final List<Station> stations;

  const RatingDialog({Key? key, required this.onSubmitted, required this.stations}) : super(key: key);

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _rating = 0;
  String? _endStation;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Rate Your Ride'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: Colors.yellow,
                ),
                onPressed: () {
                  setState(() {
                    _rating = index + 1;
                  });
                },
              );
            }),
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: 'End Station',
            ),
            value: _endStation,
            onChanged: (value) {
              setState(() {
                _endStation = value as String;
              });
            },
            items: widget.stations.map((station) {
              return DropdownMenuItem(
                value: station.id,
                child: Text(station.name),
              );
            }).toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select an end station';
              }
              return null;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_endStation != null) {
              widget.onSubmitted(_rating, _endStation!);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryRidesPage(rating: _rating),
                ),
              );
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}