import 'package:rca_app/renting/domain/domain.dart';

class VehicleMapper {
      static Vehicle jsonToEntity(Map<String, dynamic> json) => Vehicle(
            name: json["name"],
            brand: json["brand"],
            model: json["model"],
            integrity: json["integrity"],
            state: json["state"],
            year: DateTime.parse(json["year"]),
            ownerId: json["ownerId"],
            image: json["image"],
            stars: json["stars"],
            price: json["price"].toDouble(),
            currency: json["currency"],
            timeUnit: json["timeUnit"],
            categories: List<String>.from(json["categories"]),
      );
}
