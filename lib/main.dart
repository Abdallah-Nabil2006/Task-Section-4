import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'details_page.dart';
import 'login_page.dart';
import 'products_page.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: 'products',
      path: '/products',
      builder: (context, state) {
        final user = state.uri.queryParameters['user'] ?? 'Guest';
        return ProductsPage(user: user);
      },
    ),
    GoRoute(
      name: 'details',
      path: '/details/:name/:price',
      builder: (context, state) {
        return DetailsPage(
          name: state.pathParameters['name'] ?? 'Unknown product',
          price: state.pathParameters['price'] ?? '0',
        );
      },
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Shopping App',
      routerConfig: _router,
    );
  }
}
