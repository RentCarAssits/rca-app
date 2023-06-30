import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rca_app/renting/domain/entities/vehicle.dart';

final vehicleFormProvider = StateNotifierProvider.autoDispose
    .family<VehicleFormNotifier, VehicleFormState, Vehicle>((ref, vehicle) {
  return VehicleFormNotifier(vehicle: vehicle);
});

class VehicleFormNotifier extends StateNotifier<VehicleFormState> {
  final Future<bool> Function(Map<String, dynamic> vehicleLike)?
  onSubmitCallback;

  VehicleFormNotifier({
    this.onSubmitCallback,
    required Vehicle vehicle,
  }) : super(VehicleFormState(
    name: vehicle.name,
    brand: vehicle.brand,
    model: vehicle.model,
    integrity: vehicle.integrity,
    state: vehicle.state,
    year: vehicle.year,
    ownerId: vehicle.ownerId,
    image: vehicle.image,
    stars: vehicle.stars,
    price: vehicle.price,
    currency: vehicle.currency,
    timeUnit: vehicle.timeUnit,
    categories: vehicle.categories,
  ));

  Future<bool> onFormSubmit() async {
    if (!state.isFormValid) return false;

    if (onSubmitCallback == null) return false;

    final vehicleLike = {
      'name': state.name,
      'brand': state.brand,
      'model': state.model,
      'integrity': state.integrity,
      'state': state.state,
      'year': state.year.toIso8601String(),
      'ownerId': state.ownerId,
      'image': state.image,
      'stars': state.stars,
      'price': state.price,
      'currency': state.currency,
      'timeUnit': state.timeUnit,
      'categories': state.categories,
    };

    try {
      return await onSubmitCallback!(vehicleLike);
    } catch (e) {
      return false;
    }
  }
}

class VehicleFormState {
  final bool isFormValid;
  final String name;
  final String brand;
  final String model;
  final String integrity;
  final int state;
  final DateTime year;
  final int ownerId;
  final String image;
  final int stars;
  final double price;
  final String currency;
  final String timeUnit;
  final List<String> categories;

  VehicleFormState({
    this.isFormValid = false,
    required this.name,
    required this.brand,
    required this.model,
    required this.integrity,
    required this.state,
    required this.year,
    required this.ownerId,
    required this.image,
    required this.stars,
    required this.price,
    required this.currency,
    required this.timeUnit,
    required this.categories,
  });

  VehicleFormState copyWith({
    bool? isFormValid,
    String? name,
    String? brand,
    String? model,
    String? integrity,
    int? state,
    DateTime? year,
    int? ownerId,
    String? image,
    int? stars,
    double? price,
    String? currency,
    String? timeUnit,
    List<String>? categories,
  }) =>
      VehicleFormState(
        isFormValid: isFormValid ?? this.isFormValid,
        name: name ?? this.name,
        brand: brand ?? this.brand,
        model: model ?? this.model,
        integrity: integrity ?? this.integrity,
        state: state ?? this.state,
        year: year ?? this.year,
        ownerId: ownerId ?? this.ownerId,
        image: image ?? this.image,
        stars: stars ?? this.stars,
        price: price ?? this.price,
        currency: currency ?? this.currency,
        timeUnit: timeUnit ?? this.timeUnit,
        categories: categories ?? this.categories,
      );
}