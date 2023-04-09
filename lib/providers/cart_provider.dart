import 'package:lesson_14/models/cart.dart';
import 'package:lesson_14/models/product.dart';

class CartProvider {
  final _cart = Cart();

  Future<Cart> addProduct(Product product) async {
    _cart.addProduct(product);
    return _cart;
  }
}
