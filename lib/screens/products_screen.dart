import 'package:flutter/material.dart';
import 'package:lesson_14/models/product.dart';
import 'package:lesson_14/screens/cart_screen.dart';
import 'package:lesson_14/state/cart_state.dart';
import 'package:lesson_14/state/products_state.dart';
import 'package:lesson_14/widgets/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final _productsNotifier = ProductsNotifier();

  @override
  void initState() {
    super.initState();

    _productsNotifier.load();
  }

  void _navigateCart() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CartScreen()));
  }

  void _addToCart(Product product) {
    CartState.of(context).addProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    return ProductsState(
      notifier: _productsNotifier,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All products'),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: _navigateCart,
            ),
          ],
        ),
        body: Builder(builder: (context) {
          final products = ProductsState.of(context).products;

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            itemBuilder: (context, index) => MyProduct(
              product: products[index],
              onAdd: () => _addToCart(products[index]),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          );
        }),
      ),
    );
  }
}
