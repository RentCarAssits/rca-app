import '../entities/vehicle.dart';


abstract class VehiclesRepository {
  //Vehicles
  Future<List<Vehicle>> getAllVehicles();

  Future<Vehicle> getVehicleById(int id);

}
