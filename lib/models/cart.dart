import 'package:lesson_14/models/product.dart';

class Cart {
  final List<Product> products;

  Cart(this.products);

  double get totalPrice => products.map((product) => product.price).fold(0, (a, b) => a + b);

  void addProduct(Product product) {
    products.add(product);
  }
}
