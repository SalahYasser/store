import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_item.dart';

class ProductItemsGridView extends StatelessWidget {
  const ProductItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 11,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 370,
      ),
      itemBuilder: (context, index) {
        return ProductItem(
          imageUrl: 'assets/images/buttel.webp',
          title:
          'German bütel, Proto-West Germanic budil from Proto-Germanic budilaz, from Proto-Germanic beudaną',
          description:
          'Middle High German (MHG; endonym: diutsch or tiutsch; New High German: Mittelhochdeutsch, shortened as Mhdt. or Mhd.) is the term for the form of High German spoken in the High Middle Ages. ',
          price: 2,
        );
      },
    );
  }
}
