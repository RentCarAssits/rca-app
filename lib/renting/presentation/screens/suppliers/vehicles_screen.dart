import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:rca_app/renting/presentation/widgets/widgets.dart';
import 'package:rca_app/shared/shared.dart';
import 'package:rca_app/renting/presentation/providers/providers.dart';


class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        drawer: SideMenu(scaffoldKey: scaffoldKey),
        appBar: AppBar(
          title: const Text('Vehicles'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
          ],
        ),
        body: const _VehiclesView());
  }
}

class _VehiclesView extends ConsumerStatefulWidget {
  const _VehiclesView({Key? key}) : super(key: key);

  @override
  _VehiclesViewState createState() => _VehiclesViewState();
}

class _VehiclesViewState extends ConsumerState<_VehiclesView> {
  @override
  Widget build(BuildContext context) {
    final vehiclesState = ref.watch(vehiclesProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 35,
        itemCount: vehiclesState.vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehiclesState.vehicles[index];
          return GestureDetector(
            onTap: () => context.push('/vehicles/${vehicle.id}'),
            child: VehicleCard(vehicle: vehicle),
          );
        },
      ),
    );
  }
}

