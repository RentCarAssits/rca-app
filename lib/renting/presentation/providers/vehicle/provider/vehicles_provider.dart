import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rca_app/renting/domain/domain.dart';
import 'package:rca_app/renting/presentation/providers/vehicle/provider/vehicles_repository_provider.dart';


final vehiclesProvider =
StateNotifierProvider<VehiclesNotifier, VehiclesState>((ref) {
  final vehicleRepository = ref.watch(vehicleRepositoryProvider);
  return VehiclesNotifier(vehicleRepository: vehicleRepository);
});

class VehiclesState {
  final bool isLoading;
  final List<Vehicle> vehicles;

  VehiclesState({this.isLoading = false, this.vehicles = const []});

  VehiclesState copyWith({
    bool? isLoading,
    List<Vehicle>? vehicles,
  }) =>
      VehiclesState(
        isLoading: isLoading ?? this.isLoading,
        vehicles: vehicles ?? this.vehicles,
      );
}

class VehiclesNotifier extends StateNotifier<VehiclesState> {
  final VehiclesRepository vehicleRepository;

  VehiclesNotifier({required this.vehicleRepository})
      : super(VehiclesState()) {
    loadNextPage();
  }

  Future loadNextPage() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);

    final vehicles = await vehicleRepository.getAllVehicles();

    state = state.copyWith(
      vehicles: vehicles,
      isLoading: false,
    );
  }
}
