import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_14/models/cart.dart';
import 'package:lesson_14/models/product.dart';
import 'package:lesson_14/providers/cart_provider.dart';

class CartCubit extends Cubit<Cart> {
  final _cartProvider = CartProvider();

  CartCubit() : super(Cart([]));

  void addProduct(Product product) async {
    final cart = await _cartProvider.addProduct(product);
    emit(cart);
  }
}

// class CartNotifier extends ChangeNotifier {
//   final _cartProvider = CartProvider();
//
//   Cart cart = Cart();
//
//   void addProduct(Product product) async {
//     cart = await _cartProvider.addProduct(product);
//     notifyListeners();
//   }
// }

// class CartState extends InheritedNotifier<CartNotifier> {
//   const CartState({
//     super.key,
//     required super.child,
//     required super.notifier,
//   });
//
//   static CartNotifier of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<CartState>()!.notifier!;
//   }
// }
