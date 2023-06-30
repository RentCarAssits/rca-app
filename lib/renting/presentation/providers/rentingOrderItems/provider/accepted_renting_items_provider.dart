import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rca_app/renting/domain/entities/rentingOrderItem.dart';
import 'package:rca_app/renting/domain/repositories/rentingOrderItem_repository.dart';
import 'package:rca_app/renting/presentation/providers/rentingOrderItems/provider/renting_items_repository_provider.dart';

final aceptedRentingItemsByUserProvider =
    StateNotifierProvider<AcceptedRentingOrderItemsNotifier, AcceptedRentingOrderItemsState>(
        (ref) {
  final vehicleRepository = ref.watch(rentingOrderItemRepositoryProvider);
  final userId = 38;
  return AcceptedRentingOrderItemsNotifier(
      rentingOrderItemRepository: vehicleRepository, userId: userId);
});

class AcceptedRentingOrderItemsState {
  final bool isLoading;
  final List<RentingOrderItem> items;

  AcceptedRentingOrderItemsState({this.isLoading = false, this.items = const []});

  AcceptedRentingOrderItemsState copyWith({
    bool? isLoading,
    List<RentingOrderItem>? items,
  }) =>
      AcceptedRentingOrderItemsState(
        isLoading: isLoading ?? this.isLoading,
        items: items ?? this.items,
      );
}

class AcceptedRentingOrderItemsNotifier extends StateNotifier<AcceptedRentingOrderItemsState> {
  final RentingOrderItemRepository rentingOrderItemRepository;
  final int userId;
  AcceptedRentingOrderItemsNotifier(
      {required this.rentingOrderItemRepository, required this.userId})
      : super(AcceptedRentingOrderItemsState()) {
    loadNextPage();
  }

  Future loadNextPage() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);

    final rentingOrderItems =
        await rentingOrderItemRepository.getAllAcceptedRentingItems(userId);

    state = state.copyWith(
      items: rentingOrderItems,
      isLoading: false,
    );
  }
}
