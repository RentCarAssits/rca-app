import '../entities/rentingOrderItem.dart';

abstract class RentingOrderItemDatasource{
  Future<List<RentingOrderItem>> getAllByUserId(int id);

  Future<RentingOrderItem> getRentingOrderItemById(int id);

  Future<List<RentingOrderItem>> getAllByVehiclesId(List<int> vehiclesId);

  Future<List<RentingOrderItem>> getAllAcceptedRentingItems(int id);
}