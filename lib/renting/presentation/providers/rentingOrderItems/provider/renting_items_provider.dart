import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rca_app/renting/domain/domain.dart';
import 'package:rca_app/renting/presentation/providers/rentingOrderItems/provider/renting_items_repository_provider.dart';

final rentingItemsByUserProvider =
    StateNotifierProvider<RentingOrderItemsNotifier, RentingOrderItemsState>(
        (ref) {
  final vehicleRepository = ref.watch(rentingOrderItemRepositoryProvider);
  final userId = 38;
  return RentingOrderItemsNotifier(
      rentingOrderItemRepository: vehicleRepository, userId: userId);
});

class RentingOrderItemsState {
  final bool isLoading;
  final List<RentingOrderItem> items;

  RentingOrderItemsState({this.isLoading = false, this.items = const []});

  RentingOrderItemsState copyWith({
    bool? isLoading,
    List<RentingOrderItem>? items,
  }) =>
      RentingOrderItemsState(
        isLoading: isLoading ?? this.isLoading,
        items: items ?? this.items,
      );
}

class RentingOrderItemsNotifier extends StateNotifier<RentingOrderItemsState> {
  final RentingOrderItemRepository rentingOrderItemRepository;
  final int userId;
  RentingOrderItemsNotifier(
      {required this.rentingOrderItemRepository, required this.userId})
      : super(RentingOrderItemsState()) {
    loadNextPage();
  }

  Future loadNextPage() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);

    final rentingOrderItems =
        await rentingOrderItemRepository.getAllByUserId(userId);

    state = state.copyWith(
      items: rentingOrderItems,
      isLoading: false,
    );
  }
}
