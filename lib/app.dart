import 'package:flutter/material.dart';
import 'package:lesson_14/screens/products_screen.dart';
import 'package:lesson_14/state/cart_state.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _cartNotifier = CartNotifier();

  @override
  Widget build(BuildContext context) {
    return CartState(
      notifier: _cartNotifier,
      child: const MaterialApp(
        home: ProductsScreen(),
      ),
    );
  }
}
