import 'package:flutter_scooter_rent_app/history_rides_page.dart';
import 'package:flutter/material.dart';

class RatingDialog extends StatefulWidget {
  final Function(int) onSubmitted;

  const RatingDialog({Key? key, required this.onSubmitted}) : super(key: key);

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Rate Your Ride'),
      content: Row(
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
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HistoryRidesPage(rating: _rating),
              ),
            );
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}