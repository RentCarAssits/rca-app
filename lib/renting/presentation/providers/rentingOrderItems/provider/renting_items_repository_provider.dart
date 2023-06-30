import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rca_app/iam/presentation/providers/auth_provider.dart';
import 'package:rca_app/renting/domain/repositories/rentingOrderItem_repository.dart';
import 'package:rca_app/renting/infrastructure/datasources/rentingOrderItem_datasource_impl.dart';
import 'package:rca_app/renting/infrastructure/repositories/rentingOrderItem_repository.dart';

import '../../../../domain/datasources/rentingOrderItem_datasource.dart';

final rentingOrderItemRepositoryProvider = Provider<RentingOrderItemRepository>((ref) {
  final accessToken = ref.watch(authProvider).user?.token ?? '';

  final rentingOrderRepository = RentingOrderRepositoryImpl(
      RentingOrderItemDatasourceImpl(accessToken: accessToken) as RentingOrderItemDatasource);

  return rentingOrderRepository;
});
