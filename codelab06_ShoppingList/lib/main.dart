import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/item_page.dart';
import 'models/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomePage()),
        GoRoute(
          path: '/item',
          builder: (context, state) {
            final item = state.extra as Item?;
            return ItemPage(item: item);
          },
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Aplikasi Belanja',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: router,
    );
  }
}