import 'package:flutter/cupertino.dart';
import 'package:lesson_14/models/cart.dart';
import 'package:lesson_14/models/product.dart';
import 'package:lesson_14/providers/cart_provider.dart';

class CartNotifier extends ChangeNotifier {
  final _cartProvider = CartProvider();

  Cart cart = Cart();

  void addProduct(Product product) async {
    cart = await _cartProvider.addProduct(product);
    notifyListeners();
  }
}

class CartState extends InheritedNotifier<CartNotifier> {
  const CartState({
    super.key,
    required super.child,
    required super.notifier,
  });

  static CartNotifier of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CartState>()!.notifier!;
  }
}
