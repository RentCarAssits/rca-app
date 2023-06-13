
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rca_app/aim/iam.dart';
//import 'package:rca_app/providers/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [

    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

/*
    GoRoute(
      path: '/suppliers',
      builder: (context, state) => const SuppliersScreen(),
    ),
    GoRoute(
      path: '/suppliers/:id',
      builder: (context, state) => SupplierScreen(
        supplierId: int.parse(state.params['id'] ?? '0'),
      ),
    ),


    GoRoute(
      path: '/products/:id',
      builder: (context, state) => ProductScreen(
        supplierId: int.parse(state.params['id'] ?? '0'),
      ),
    ),

    GoRoute(
      path: '/supplier/:id/products',
      builder: (context, state) => ProductsScreen(
        supplierId: int.parse(state.params['id'] ?? '0'),
      ),
    ),*/
  ],
);
