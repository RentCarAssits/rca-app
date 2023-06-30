import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:rca_app/renting/presentation/widgets/widgets.dart';
import 'package:rca_app/shared/shared.dart';
import 'package:rca_app/renting/presentation/providers/providers.dart';

class RentingOrdenItemsByVehicleScreen extends StatelessWidget {
  const RentingOrdenItemsByVehicleScreen({Key? key}) : super(key: key);
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
        body: const _RentingOrderItemsByVehicleView());
  }
}

class _RentingOrderItemsByVehicleView extends ConsumerStatefulWidget {
  const _RentingOrderItemsByVehicleView({Key? key}) : super(key: key);

  @override
  _RentingOrderItemsByVehiclesViewState createState() => _RentingOrderItemsByVehiclesViewState();
}

class _RentingOrderItemsByVehiclesViewState extends ConsumerState<_RentingOrderItemsByVehicleView> {
  @override
  Widget build(BuildContext context) {
    final vehiclesState = ref.watch(rentingItemsByUserProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: vehiclesState.items.length,
        itemBuilder: (context, index) {
          final item = vehiclesState.items[index];
          final bool isOState = item.state == 'O';
          String estadoText;
          Color estadoColor;

          switch (item.state) {
            case 'O':
              estadoText = 'ON REQUEST';
              estadoColor = Colors.orange;
              break;
            case 'A':
              estadoText = 'ACCEPTED';
              estadoColor = Colors.green;
              break;
            case 'D':
              estadoText = 'DENIED';
              estadoColor = Colors.red;
              break;
            case 'R':
              estadoText = 'ORDERED';
              estadoColor = Colors.blue;
              break;
            default:
              estadoText = '';
              estadoColor = Colors.black;
              break;
          }

          return Container(
            decoration: BoxDecoration(
              color: estadoColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: estadoColor,
                width: 1.0,
              ),
            ),
            child: ListTile(
              leading: Text(
                estadoText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: estadoColor,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: ${item.rentingPrice}'),
                  Text('Start Date: ${item.startDate}'),
                  Text('End Date: ${item.endDate}'),
                ],
              ),
              trailing: isOState
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            // Handle eye button press
                            viewItem();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () {
                            // Handle check button press
                            acceptItem();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            // Handle close button press
                            denyItem();
                          },
                        ),
                      ],
                    )
                  : IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        // Handle eye button press
                        viewItem();
                      },
                    ),
            ),
          );
        },
      ),
    );
  }

  void viewItem() {
    // Handle the logic to view the item here
    print('View Item pressed');
  }

  void acceptItem() {
    // Handle the logic to accept the item here
    print('Accept Item pressed');
  }

  void denyItem() {
    // Handle the logic to deny the item here
    print('Deny Item pressed');
  }
}

