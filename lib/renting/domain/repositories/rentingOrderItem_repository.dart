
import 'package:rca_app/renting/domain/entities/rentingOrderItem.dart';

abstract class RentingOrderItemRepository {
  //Vehicles
  Future<List<RentingOrderItem>> getAllByUserId(int id);

  Future<RentingOrderItem> getRentingOrderItemById(int id);

  Future<List<RentingOrderItem>> getAllByVehiclesId(List<int> vehiclesId);

  Future<List<RentingOrderItem>> getAllAcceptedRentingItems(int id);
}