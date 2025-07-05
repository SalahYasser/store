import 'package:flutter/material.dart';
import 'package:store_app/features/home/data/models/product_model.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_item.dart';

class ProductItemsGridView extends StatelessWidget {
  const ProductItemsGridView({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 370,
      ),
      itemBuilder: (context, index) {

        final product = products[index];

        return ProductItem(
          imageUrl: product.imageUrl.isNotEmpty
              ? product.imageUrl
              : 'assets/images/buttel.webp',
          title: product.title.isNotEmpty
              ? product.title
              : 'Default Title',
          description: product.description.isNotEmpty
              ? product.description
              : 'Default Description',
          price: product.price,
        );
      },
    );
  }
}
