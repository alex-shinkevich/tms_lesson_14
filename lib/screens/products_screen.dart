import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_14/models/cart.dart';
import 'package:lesson_14/models/product.dart';
import 'package:lesson_14/screens/cart_screen.dart';
import 'package:lesson_14/state/cart_state.dart';
import 'package:lesson_14/state/products_state.dart';
import 'package:lesson_14/widgets/product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  void _navigateCart(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CartScreen()));
  }

  void _addToCart(BuildContext context, Product product) {
    // CartState.of(context).addProduct(product);
    context.read<CartCubit>().addProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..load(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All products'),
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () => _navigateCart(context),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    // child: Consumer<CartNotifier>(
                    //   builder: (context, notifier, child) {
                    //     return Text(
                    //       notifier.cart.products.length.toString(),
                    //     );
                    //   }
                    // ),
                    child: BlocBuilder<CartCubit, Cart>(
                      builder: (context, Cart cart) {
                        return Text(
                          cart.products.length.toString(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: BlocBuilder<ProductsCubit, List<Product>>(builder: (context, products) {
          // final products = ProductsState.of(context).products;
          // final products = Provider.of<ProductsNotifier>(context).products;
          // final products = context.read<ProductsNotifier>().products;
          // final products = context.watch<ProductsNotifier>().products;

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            itemBuilder: (context, index) => MyProduct(
              product: products[index],
              onAdd: () => _addToCart(context, products[index]),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          );
        }),
      ),
    );
  }
}
