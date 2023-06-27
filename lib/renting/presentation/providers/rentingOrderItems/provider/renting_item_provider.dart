import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rca_app/renting/domain/domain.dart';
import 'package:rca_app/renting/presentation/providers/rentingOrderItems/provider/renting_items_repository_provider.dart';

final rentingItemProvider = StateNotifierProvider.autoDispose
    .family<RentingOrderItemNotifier, RentingOrderItemState, int>(
        (ref, vehicleId) {
  final vehicleRepository = ref.watch(rentingOrderItemRepositoryProvider);

  return RentingOrderItemNotifier(
      rentingOrderItemRepository: vehicleRepository, rentingOrderId: vehicleId);
});

class RentingOrderItemNotifier extends StateNotifier<RentingOrderItemState> {
  final RentingOrderItemRepository rentingOrderItemRepository;

  RentingOrderItemNotifier({
    required this.rentingOrderItemRepository,
    required int rentingOrderId,
  }) : super(RentingOrderItemState(id: rentingOrderId)) {
    loadVehicle();
  }

  RentingOrderItem newEmptyRentingOrder() {
    return RentingOrderItem(
      id: 0,
      rentingPrice: '',
      rentingUnit: '',
      currency: '',
      state: '',
      startDate: DateTime.now().toString(),
      endDate: DateTime.now().toString(),
      vehicleId: 0,
      requesterId: 0,
    );
  }

  Future<void> loadVehicle() async {
    try {
      if (state.id == 0) {
        state = state.copyWith(
          isLoading: false,
          item: newEmptyRentingOrder(),
        );
        return;
      }

      final vehicle = await rentingOrderItemRepository
          .getRentingOrderItemById(state.id as int);

      state = state.copyWith(isLoading: false, item: vehicle);
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

class RentingOrderItemState {
  final int id;
  final RentingOrderItem? item;
  final bool isLoading;
  final bool isSaving;

  RentingOrderItemState({
    required this.id,
    this.item,
    this.isLoading = true,
    this.isSaving = false,
  });

  RentingOrderItemState copyWith({
    int? id,
    RentingOrderItem? item,
    bool? isLoading,
    bool? isSaving,
  }) =>
      RentingOrderItemState(
        id: id ?? this.id,
        item: item ?? this.item,
        isLoading: isLoading ?? this.isLoading,
        isSaving: isSaving ?? this.isSaving,
      );
}
