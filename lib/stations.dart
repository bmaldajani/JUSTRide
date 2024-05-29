import 'package:flutter_scooter_rent_app/scooter.dart';

import 'location.dart';

class Station {
  String id;
  String name;
  List<Scooter> scooters;
  Location location;

  Station({required this.id, required this.name, required this.scooters, required this.location});
  void addScooter(Scooter scooter) {
    scooters.add(scooter);
  }

  void removeScooter(Scooter scooter) {
    scooters.remove(scooter);
  }
}