import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_items_grid_view.dart';

import '../../../data/models/product_model.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ProductItemsGridView(products: products,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
