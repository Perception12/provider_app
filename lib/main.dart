import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/counter_provider.dart';
import 'package:provider_app/providers/shopping_cart_provider.dart';
import 'package:provider_app/screens/home_page.dart';
import 'package:provider_app/screens/second_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
      ChangeNotifierProvider(create: (_) => ShoppingCart())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const HomePage(),
      '/second': (context) => const SecondPage(),
    });
  }
}
