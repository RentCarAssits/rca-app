import 'package:rca_app/renting/domain/domain.dart';
import 'package:rca_app/renting/infrastructure/infrastructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rca_app/iam/presentation/providers/auth_provider.dart';

final rentingOrderItemRepositoryProvider = Provider<RentingOrderItemRepository>((ref) {
  final accessToken = ref.watch(authProvider).user?.token ?? '';

  final rentingOrderRepository = RentingOrderRepositoryImpl(
      RentingOrderItemDatasourceImpl(accessToken: accessToken));

  return rentingOrderRepository;
});
