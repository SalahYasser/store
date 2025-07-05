import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.dio) : super(ProductsInitial());

  final Dio dio;

  // List<ProductModel> products = [];

  Future<void> getProducts() async {

    emit(ProductsLoading());

    try {
      final response = await dio.get('https://dummyjson.com/product');

      if (response.statusCode == 200) {

        final products =
            (response.data['products'] as List)
                .map((e) => ProductModel.fromJson(e))
                .toList();

        emit(ProductsSuccess(products: products));

      } else {
        throw Exception('Failed to load products');
      }

    } catch (e) {
      emit(ProductsFailure(errMessage: e.toString()));
    }
  }
}
