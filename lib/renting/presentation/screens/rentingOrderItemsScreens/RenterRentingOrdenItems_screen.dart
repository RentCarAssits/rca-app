import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:rca_app/renting/presentation/widgets/widgets.dart';
import 'package:rca_app/shared/shared.dart';
import 'package:rca_app/renting/presentation/providers/providers.dart';

class RenterRentingOrdenItemsScreen extends StatelessWidget {
  const RenterRentingOrdenItemsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        drawer: SideMenu(scaffoldKey: scaffoldKey),
        appBar: AppBar(
          title: const Text('Request History'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
          ],
        ),
        body: const _RentingOrderItemsView());
  }
}

class _RentingOrderItemsView extends ConsumerStatefulWidget {
  const _RentingOrderItemsView({Key? key}) : super(key: key);

  @override
  _RentingOrderItemsViewState createState() => _RentingOrderItemsViewState();
}

class _RentingOrderItemsViewState
    extends ConsumerState<_RentingOrderItemsView> {
  @override
  Widget build(BuildContext context) {
    final vehiclesState = ref.watch(rentingItemsByUserProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: 35,
        itemCount: vehiclesState.items.length,
        itemBuilder: (context, index) {
          final item = vehiclesState.items[index];
          return GestureDetector(
            child: RentingOrderItemCard(item: item),
          );
        },
      ),
    );
  }
}
