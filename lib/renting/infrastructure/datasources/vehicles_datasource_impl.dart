import 'package:dio/dio.dart';
import 'package:rca_app/renting/domain/dataSources/vehicles_datasource.dart';
import 'package:rca_app/renting/domain/entities/vehicle.dart';
import 'package:rca_app/renting/infrastructure/mappers/vehicle_mapper.dart';

class VehiclesDatasourceImpl extends VehiclesDatasource {
  late final Dio dio;
  final String accessToken;

  VehiclesDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
            baseUrl: ('https://rca.azurewebsites.net/api/v1'),
            headers: {'Authorization': 'Bearer $accessToken'}));

  ///Vehicles
  @override
  Future<Vehicle> getVehicleById(int id) async {
    final response = await dio.get<Map<String, dynamic>>('/vehicles/$id');

    Vehicle? vehicle;
    if (response.data != null) {
      final result = response.data?['result'];
      //print(result);
      if (result != null) {
        vehicle = VehicleMapper.jsonToEntity(result);
      }
    }

    if (vehicle == null) {
      throw Exception('Failed to load vehicle');
    }
    return vehicle;
  }


  @override
  Future<List<Vehicle>> getAllVehicles() async {
    final response = await dio.get<Map<String, dynamic>>('/vehicles');

    final List<Vehicle> vehicles = [];
    if (response.data != null) {
      final results = response.data?['result'];

      if (results != null) {
        for (final vehicle in results) {
          vehicles.add(VehicleMapper.jsonToEntity(vehicle));
        }
      }
    }
    return vehicles;
  }

}
