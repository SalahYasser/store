import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.dio) : super(ProductsInitial());

  final Dio dio;

  Future<void> getProducts() async {

    emit(ProductsLoading());

    try {
      final response = await dio.get('https://dummyjson.com/products');

      if (response.statusCode == 200) {

        final products =
            (response.data['products'] as List)
                .map((e) => ProductModel.fromJson(e))
                .toList();

        emit(ProductsSuccess(products: products));
      } else {
        emit(
          ProductsFailure(
            errMessage: 'error status code ${response.statusCode}',
          ),
        );
      }

    } catch (e) {
      emit(ProductsFailure(errMessage: e.toString()));
    }
  }
}
