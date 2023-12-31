import 'package:rca_app/renting/domain/domain.dart';
import 'package:rca_app/renting/infrastructure/datasources/vehicles_datasource_impl.dart';
import 'package:rca_app/renting/infrastructure/repositories/vehicles_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rca_app/iam/presentation/providers/auth_provider.dart';

final vehicleRepositoryProvider = Provider<VehiclesRepository>((ref) {
  final accessToken = ref.watch(authProvider).user?.token ?? '';

  final vehicleRepository = VehiclesRepositoryImpl(
      VehiclesDatasourceImpl(accessToken: accessToken));

  return vehicleRepository;
});
