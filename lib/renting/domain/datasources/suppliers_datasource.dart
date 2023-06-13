import '../entities/vehicle.dart';

abstract class SuppliersDatasource {
  Future<List<Vehicle>> getVehicles();

  Future<Vehicle> getVehicleById(int id);
}
