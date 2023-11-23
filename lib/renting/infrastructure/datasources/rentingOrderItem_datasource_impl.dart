import 'package:dio/dio.dart';
import 'package:rca_app/renting/domain/domain.dart';
import 'package:rca_app/renting/infrastructure/infrastructure.dart';


class RentingOrderItemDatasourceImpl extends RentingOrderItemDatasource {
  late final Dio dio;
  final String accessToken;
   
  RentingOrderItemDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
            baseUrl: ('https://rca-iot-parsimonia.azurewebsites.net/api/v1'),
            headers: {'Authorization': 'Bearer $accessToken'}));

  @override
  Future<List<RentingOrderItem>> getAllByUserId(int id) async {
    final response = await dio.get<Map<String, dynamic>>('/Renting-Order-Items/get-by-renter-id/$id');

    final List<RentingOrderItem> rentingItems = [];
    if (response.data != null) {
      final results = response.data?['result'];
      if (results != null) {
        for (final vehicle in results) {
          rentingItems.add(RentingOrderItemMapper.jsonToEntity(vehicle));
        }
      }
    }
    return rentingItems;
  }
  @override
  Future<RentingOrderItem> getRentingOrderItemById(int id)async{
    final response = await dio.get('/Renting-Order-Items/$id');
    final data = response.data;

    ///print(response);
    final rentingItem = RentingOrderItemMapper.jsonToEntity(data);

    return rentingItem;
  }

  Future<List<RentingOrderItem>> getAllByVehiclesId(List<int> vehiclesId)async {
    Map<String, dynamic> requestBody = {
    'vehicleIds': vehiclesId,
  };
    final response = await dio.post<Map<String, dynamic>>('/Renting-Order-Items/get-by-vehicles'
    ,queryParameters: requestBody,);

    final List<RentingOrderItem> rentingItems = [];
    if (response.data != null) {
      final results = response.data?['result'];
      if (results != null) {
        for (final vehicle in results) {
          rentingItems.add(RentingOrderItemMapper.jsonToEntity(vehicle));
        }
      }
    }
    return rentingItems;
  }
  Future<List<RentingOrderItem>> getAllAcceptedRentingItems(int id)async {
    final response = await dio.get<Map<String, dynamic>>('/Renting-Order-Items/get-all-accepted-by-renter-id/$id');

    final List<RentingOrderItem> rentingItems = [];
    if (response.data != null) {
      final results = response.data?['result'];
      if (results != null) {
        for (final vehicle in results) {
          rentingItems.add(RentingOrderItemMapper.jsonToEntity(vehicle));
        }
      }
    }
    return rentingItems;
  }
}
