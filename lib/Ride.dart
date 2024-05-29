import 'package:flutter_scooter_rent_app/scooter.dart';
import 'package:flutter_scooter_rent_app/stations.dart';

class Ride {
  final String id;
  final Scooter scooter;
  final String userId;
  late final String startStation;
  late final String endStation;
  late final DateTime startDate;
  late final DateTime endDate;
  late final double finalCost;
  late final Duration duration;

  Ride({
    required this.id,
    required this.scooter,
    required this.userId,
    required this.startStation,
    required this.endStation,
    required this.startDate,
    required this.endDate,
    this.finalCost = 0.0,
  }) {
    this.duration = endDate.difference(startDate);
  }

  void startRide(Scooter scooter) {
    this.startStation = scooter.stationid;
    this.startDate = DateTime.now();
    scooter.book();
  }

  void endRide() {
    this.endDate = DateTime.now();
    this.duration = this.endDate.difference(this.startDate);
    scooter.unbook();
    calculateCost();
  }

  void setEndStation(String stationid) {
    this.endStation = stationid;
  }

  void calculateCost() {
    final costPerMinute = 0.15;
    final cost = duration.inMinutes * costPerMinute;
    this.finalCost = cost;
  }
}