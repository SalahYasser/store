import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_items_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
                  ProductItemsGridView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
