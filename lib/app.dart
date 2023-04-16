import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_14/screens/products_screen.dart';
import 'package:lesson_14/state/cart_state.dart';
import 'package:lesson_14/state/products_state.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // final _cartNotifier = CartNotifier();

  @override
  Widget build(BuildContext context) {
    // return CartState(
    //   notifier: _cartNotifier,
    //   child: const MaterialApp(
    //     home: ProductsScreen(),
    //   ),
    // );

    // return ChangeNotifierProvider(
    //   create: (context) => CartNotifier(),
    //   child: const MaterialApp(
    //     home: ProductsScreen(),
    //   ),
    // );

    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => CartNotifier()),
    //     ChangeNotifierProvider(create: (_) => ProductsNotifier()..load()),
    //   ],
    //   child: const MaterialApp(
    //     home: ProductsScreen(),
    //   ),
    // );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => ProductsCubit()..load()),
      ],
      child: const MaterialApp(
        home: ProductsScreen(),
      ),
    );

    // return BlocProvider(
    //   create: (context) => CartCubit(),
    //   child: const MaterialApp(
    //     home: ProductsScreen(),
    //   ),
    // );
  }
}
