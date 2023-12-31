import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rca_app/iam/presentation/providers/auth_provider.dart';

// import 'package:go_router/go_router.dart';
import 'package:rca_app/shared/shared.dart';

import 'custom_filled_button.dart';

class SideMenu extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends ConsumerState<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final textStyles = Theme.of(context).textTheme;

    return NavigationDrawer(
        elevation: 1,
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });

          // final menuItem = appMenuItems[value];
          // context.push( menuItem.link );
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, hasNotch ? 0 : 20, 16, 0),
            child: Text('Rca', style: textStyles.titleMedium),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 16, 10),
            child: Text('Welcome', style: textStyles.titleSmall),
          ),
          ListTile(
            title: const Text('Vehicles'),
            leading: const Icon(Icons.car_rental),
            onTap: () => context.go('/vehicles'),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('Renter'),
          ),
          ListTile(
            title: const Text('Reting Items'),
            leading: const Icon(Icons.car_rental),
            onTap: () => context.go('/renter-renting-order-items'),
          ),
          ListTile(
            title: const Text('Aceepted reting Items'),
            leading: const Icon(Icons.car_rental),
            onTap: () => context.go('/accepted-renting-order-items'),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('Owner'),
          ),
          ListTile(
            title: const Text('Renting Items'),
            leading: const Icon(Icons.car_rental),
            onTap: () => context.go('/owner-renting-order-items'),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('Otras opciones'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomFilledButton(
                onPressed: () {
                  ref.read(authProvider.notifier).logout();
                  context.go('/login');
                },
                text: 'Cerrar sesión'),
          ),
        ]);
  }
}
