import '../entities/vehicle.dart';

abstract class VehiclesDatasource {
  Future<Vehicle> getVehicleById(int id);

  Future<List<Vehicle>> getAllVehicles();

}
