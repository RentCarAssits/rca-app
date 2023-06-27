import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rca_app/renting/domain/domain.dart';
import 'package:rca_app/renting/presentation/providers/rentingOrderItems/provider/renting_items_repository_provider.dart';

final rentingItemsByVehiclesId = StateNotifierProvider<
    RentingOrderItemsByVehiclesNotifier,
    RentingOrderItemsByVehiclesIdState>((ref) {
  final vehicleRepository = ref.watch(rentingOrderItemRepositoryProvider);
  final List<int> vehiclesId = [1, 2, 3, 4, 5, 6];
  return RentingOrderItemsByVehiclesNotifier(
      rentingOrderItemRepository: vehicleRepository, vehiclesId: vehiclesId);
});

class RentingOrderItemsByVehiclesIdState {
  final bool isLoading;
  final List<RentingOrderItem> items;

  RentingOrderItemsByVehiclesIdState(
      {this.isLoading = false, this.items = const []});

  RentingOrderItemsByVehiclesIdState copyWith({
    bool? isLoading,
    List<RentingOrderItem>? items,
  }) =>
      RentingOrderItemsByVehiclesIdState(
        isLoading: isLoading ?? this.isLoading,
        items: items ?? this.items,
      );
}

class RentingOrderItemsByVehiclesNotifier
    extends StateNotifier<RentingOrderItemsByVehiclesIdState> {
  final RentingOrderItemRepository rentingOrderItemRepository;
  final List<int> vehiclesId;
  RentingOrderItemsByVehiclesNotifier(
      {required this.rentingOrderItemRepository, required this.vehiclesId})
      : super(RentingOrderItemsByVehiclesIdState()) {
    loadNextPage();
  }

  Future loadNextPage() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);

    final rentingOrderItems =
        await rentingOrderItemRepository.getAllByVehiclesId(vehiclesId);

    state = state.copyWith(
      items: rentingOrderItems,
      isLoading: false,
    );
  }
}
