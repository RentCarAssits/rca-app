import 'package:rca_app/renting/domain/repositories/vehicles_repository.dart';
import 'package:rca_app/renting/infrastructure/datasource/vehicles_datasource_impl.dart';
import 'package:rca_app/renting/infrastructure/repositories/vehicles_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rca_app/iam/presentation/providers/auth_provider.dart';

final vehicleRepositoryProvider = Provider<VehiclesRepository>((ref) {
  final accessToken = ref.watch(authProvider).user?.token ?? '';

  final vehicleRepository = VehiclesRepositoryImpl(
      VehiclesDatasourceImpl(accessToken: accessToken));

  return vehicleRepository;
});
