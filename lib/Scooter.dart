class Scooter {
  final String id;
  final String location;
  final int batteryLevel;
  bool isBooked;
  bool isAvailable;

  Scooter({
    this.id = "1234",
    this.location = "M4",
    this.batteryLevel = 80,
    this.isBooked = false,
    this.isAvailable = true,
  });


  void book() {
    if (isAvailable) {
      isBooked = true;
      isAvailable = false;
    }
  }

  void unbook() {
    if (isBooked) {
      isBooked = false;
      isAvailable = true;
    }
  }
}