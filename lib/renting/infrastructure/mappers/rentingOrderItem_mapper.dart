import 'package:rca_app/renting/domain/entities/rentingOrderItem.dart';


class RentingOrderItemMapper{
 static RentingOrderItem jsonToEntity(Map<String, dynamic> json) => RentingOrderItem(
        id: json["id"],
        rentingPrice: json["rentingPrice"],
        rentingUnit: json["rentingUnit"],
        currency: json["currency"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        vehicleId: json["vehicleId"],
        state: json["state"],
        requesterId: json["requesterId"],
      );
}