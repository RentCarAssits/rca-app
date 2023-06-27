import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:rca_app/renting/presentation/providers/rentingOrderItems/provider/accepted_renting_items_provider.dart';
import 'package:rca_app/renting/presentation/widgets/widgets.dart';
import 'package:rca_app/shared/shared.dart';
import 'package:rca_app/renting/presentation/providers/providers.dart';

class AcceptedRentingOrdenItemsScreen extends StatelessWidget {
  const AcceptedRentingOrdenItemsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        drawer: SideMenu(scaffoldKey: scaffoldKey),
        appBar: AppBar(
          title: const Text('Accepted Requests'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
          ],
        ),
        body: const _AcceptedRentingOrderItemsView());
  }
}

class _AcceptedRentingOrderItemsView extends ConsumerStatefulWidget {
  const _AcceptedRentingOrderItemsView({Key? key}) : super(key: key);

  @override
  _AcceptedOrderItemsViewState createState() => _AcceptedOrderItemsViewState();
}

class _AcceptedOrderItemsViewState
    extends ConsumerState<_AcceptedRentingOrderItemsView> {
  @override
  Widget build(BuildContext context) {
    final vehiclesState = ref.watch(aceptedRentingItemsByUserProvider);

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
