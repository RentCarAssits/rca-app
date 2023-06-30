import 'package:rca_app/renting/domain/entities/vehicle.dart';

class VehicleMapper {
      static Vehicle jsonToEntity(Map<String, dynamic> json) => Vehicle(
            id: json["id"] is int ? json["id"] : int.parse(json["id"] ?? '0'),
            name: json["name"],
            brand: json["brand"],
            model: json["model"],
            integrity: json["integrity"],
            state: json["state"] is int ? json["state"] : int.parse(json["state"] ?? '0'),
            year: DateTime.parse(json["year"]),
            ownerId: json["ownerId"],
            image: json["image"],
            stars: json["stars"] is int ? json["stars"] : int.parse(json["stars"] ?? '0'),
            price: json["price"] is double ? json["price"] : double.parse(json["price"].toString()),
            currency: json["currency"],
            timeUnit: json["timeUnit"],
            categories: List<String>.from(json["categories"]),
      );
}
