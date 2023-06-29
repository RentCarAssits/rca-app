import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rca_app/shared/shared.dart';

import '../../../../shared/widgets/custom_product_field.dart';
import '../../../../shared/widgets/full_screen_loader.dart';
import '../../../domain/entities/vehicle.dart';
import '../../providers/vehicle/forms/vehicle_form_provider.dart';
import '../../providers/vehicle/provider/vehicle_provider.dart';

class VehicleScreen extends ConsumerWidget {
  final int vehicleId;

  const VehicleScreen({Key? key, required this.vehicleId}) : super(key: key);

  void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Vehicle Updated')));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleState = ref.watch(vehicleProvider(vehicleId));

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vehicle Request'),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined))
          ],
        ),
        body: vehicleState.isLoading
            ? const FullScreenLoader()
            : _VehicleView(vehicle: vehicleState.vehicle!),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.car_rental),
          label: const Text("Request"),
          onPressed: () {},
        ),
      ),
    );
  }
}

class _VehicleView extends ConsumerWidget {
  final Vehicle vehicle;

  const _VehicleView({required this.vehicle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleForm = ref.watch(vehicleFormProvider(vehicle));

    final textStyles = Theme.of(context).textTheme;

    return ListView(
      children: [
        SizedBox(
          height: 250,
          width: 600,
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/no-image.jpg',
            image: vehicleForm.image,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Center(
            child: Text(
          vehicleForm.name,
          style: textStyles.titleSmall,
          textAlign: TextAlign.center,
        )),
        const SizedBox(height: 10),
        _VehicleInformation(vehicle: vehicle),
      ],
    );
  }
}

class _VehicleInformation extends ConsumerWidget {
  final Vehicle vehicle;

  const _VehicleInformation({required this.vehicle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleForm = ref.watch(vehicleFormProvider(vehicle));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Vehicle Information'),
          const SizedBox(height: 15),
          CustomVehicleField(
            maxLines: 4,
            label: 'Name',
            text: vehicleForm.name,
          ),
          const SizedBox(height: 20),
          CustomVehicleField(
            maxLines: 4,
            label: 'Description',
            text: vehicleForm.integrity,
          ),
          const SizedBox(height: 20),
          CustomVehicleField(
            maxLines: 4,
            label: 'Year',
            text: vehicleForm.year.toString(),
            isDate: true,
          ),

          const SizedBox(height: 20),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
