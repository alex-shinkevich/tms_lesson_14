import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_14/models/product.dart';
import 'package:lesson_14/providers/products_provider.dart';

class ProductsCubit extends Cubit<List<Product>> {
  final _productsProvider = ProductsProvider();

  ProductsCubit() : super(const []);

  void load() async {
    emit(await _productsProvider.getProducts());
  }
}

// class ProductsNotifier extends ChangeNotifier {
//   final _productsProvider = ProductsProvider();
//
//   List<Product> products = const [];
//
//   void load() async {
//     products = await _productsProvider.getProducts();
//     notifyListeners();
//   }
// }

// class ProductsState extends InheritedNotifier<ProductsNotifier> {
//   const ProductsState({
//     super.key,
//     required super.child,
//     required super.notifier,
//   });
//
//   static ProductsNotifier of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<ProductsState>()!.notifier!;
//   }
// }
