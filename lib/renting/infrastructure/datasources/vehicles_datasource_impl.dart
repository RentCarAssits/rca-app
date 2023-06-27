import 'package:dio/dio.dart';
import 'package:rca_app/shared/config/config.dart';
import 'package:rca_app/renting/domain/domain.dart';
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
    final response = await dio.get('/vehicles/$id');
    final data = response.data;

    ///print(response);
    final vehicle = VehicleMapper.jsonToEntity(data);

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
