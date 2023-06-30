import 'package:rca_app/renting/domain/dataSources/vehicles_datasource.dart';
import 'package:rca_app/renting/domain/entities/vehicle.dart';
import 'package:rca_app/renting/domain/repositories/vehicles_repository.dart';

class VehiclesRepositoryImpl extends VehiclesRepository {
  final VehiclesDatasource datasource;

  VehiclesRepositoryImpl(this.datasource);


  @override
  Future<Vehicle> getVehicleById(int id) {
    return datasource.getVehicleById(id);
  }

  @override
  Future<List<Vehicle>> getAllVehicles() {
    return datasource.getAllVehicles();
  }
}
