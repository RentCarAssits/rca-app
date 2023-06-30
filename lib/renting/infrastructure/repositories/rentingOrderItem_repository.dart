import 'package:rca_app/renting/domain/datasources/rentingOrderItem_datasource.dart';
import 'package:rca_app/renting/domain/entities/rentingOrderItem.dart';
import 'package:rca_app/renting/domain/repositories/rentingOrderItem_repository.dart';

class RentingOrderRepositoryImpl extends RentingOrderItemRepository {
  final RentingOrderItemDatasource datasource;

  RentingOrderRepositoryImpl(this.datasource);

  @override
  Future<List<RentingOrderItem>> getAllByUserId(int id) {
    return datasource.getAllByUserId(id);
  }
  @override
  Future<RentingOrderItem> getRentingOrderItemById(int id) {
    return datasource.getRentingOrderItemById(id);
  }

  @override
  Future<List<RentingOrderItem>> getAllByVehiclesId(List<int> vehiclesId) {
    return datasource.getAllByVehiclesId(vehiclesId);
  }
  @override
  Future<List<RentingOrderItem>> getAllAcceptedRentingItems(int id) {
    return datasource.getAllAcceptedRentingItems(id);
  }

}
