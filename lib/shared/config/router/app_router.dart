import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rca_app/iam/iam.dart';
import 'package:rca_app/renting/presentation/screens/rentingOrderItemsScreens/RenterRentingOrdenItems_screen.dart';
import 'package:rca_app/renting/presentation/screens/rentingOrderItemsScreens/accepted_renting_items_screen.dart';
import 'package:rca_app/renting/presentation/screens/rentingOrderItemsScreens/renting_items_by_vehicles_screen.dart';
import 'package:rca_app/renting/presentation/screens/screens.dart';
//import 'package:rca_app/providers/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    ///Iam
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    ///Renting
    GoRoute(
      path: '/vehicles',
      builder: (context, state) => const VehiclesScreen(),
    ),
    GoRoute(
      path: '/vehicles/:id',
      builder: (context, state) =>
          VehicleScreen(vehicleId: int.parse(state.params['id'] ?? '0')),
    ),

    GoRoute(
      path: '/renter-renting-order-items',
      builder: (context, state) => const RenterRentingOrdenItemsScreen(),
    ),

    GoRoute(
      path: '/accepted-renting-order-items',
      builder: (context, state) => const AcceptedRentingOrdenItemsScreen(),
    ),

    GoRoute(
      path: '/owner-renting-order-items',
      builder: (context, state) => const RentingOrdenItemsByVehicleScreen(),
    ),
  ],
);
