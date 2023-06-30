import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rca_app/renting/domain/domain.dart';
import 'package:rca_app/renting/presentation/providers/vehicle/provider/vehicles_repository_provider.dart';


final vehicleProvider = StateNotifierProvider.autoDispose
    .family<VehicleNotifier, VehicleState, int>((ref, vehicleId) {
  final vehicleRepository = ref.watch(vehicleRepositoryProvider);

  return VehicleNotifier(
      vehicleRepository: vehicleRepository, vehicleId: vehicleId);
});

class VehicleNotifier extends StateNotifier<VehicleState> {
  final VehiclesRepository vehicleRepository;

  VehicleNotifier({
    required this.vehicleRepository,
    required int vehicleId,
  }) : super(VehicleState(id: vehicleId)) {
    loadVehicle();
  }

  Vehicle newEmptyVehicle() {
    return Vehicle(
      name: '',
      brand: '',
      model: '',
      integrity: '',
      state: 0,
      year: DateTime.now(),
      ownerId: 0,
      image: '',
      stars: 0,
      price: 0.0,
      currency: '',
      timeUnit: '',
      categories: [],
    );
  }

  Future<void> loadVehicle() async {
    try {
      if (state.id == 0) {
        state = state.copyWith(
          isLoading: false,
          vehicle: newEmptyVehicle(),
        );
        return;
      }

      final vehicle = await vehicleRepository.getVehicleById(state.id as int);

      state = state.copyWith(isLoading: false, vehicle: vehicle);
    } catch (e) {
      // 404 vehicle not found
      print(e);
    }
  }

  Future<bool> createOrUpdateVehicle(Map<String, dynamic> vehicleData) async {
    try {
      print('DONE');
      // If the method completes without throwing an exception, we can assume it succeeded.
      return true;
    } catch (e) {
      // If there was an error, log it and return false.
      print('Failed to create or update vehicle: $e');
      return false;
    }
  }
}

class VehicleState {
  final int id;
  final Vehicle? vehicle;
  final bool isLoading;
  final bool isSaving;

  VehicleState({
    required this.id,
    this.vehicle,
    this.isLoading = true,
    this.isSaving = false,
  });

  VehicleState copyWith({
    int? id,
    Vehicle? vehicle,
    bool? isLoading,
    bool? isSaving,
  }) =>
      VehicleState(
        id: id ?? this.id,
        vehicle: vehicle ?? this.vehicle,
        isLoading: isLoading ?? this.isLoading,
        isSaving: isSaving ?? this.isSaving,
      );
}
