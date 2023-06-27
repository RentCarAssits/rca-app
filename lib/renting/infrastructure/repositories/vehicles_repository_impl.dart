import 'package:rca_app/renting/domain/domain.dart';

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
