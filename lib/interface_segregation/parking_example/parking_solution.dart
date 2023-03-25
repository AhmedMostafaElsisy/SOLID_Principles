import 'dart:developer';

class Car {}

abstract class ParkingLot {
  void parkCar();

  void unParkCar();

  int getCapacity();
}

/// * segregation new interface
abstract class PaidParkingLot implements ParkingLot {
  double calculateFree(Car car);

  void doPayment(Car car);
}

class FreeParking implements ParkingLot {
  @override
  void parkCar() {
    log("car park");
  }

  @override
  void unParkCar() {
    log("unPark car");
  }

  @override
  int getCapacity() {
    return 0;
  }
}
