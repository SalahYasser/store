import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/buttel.webp', height: 200),
            const SizedBox(height: 16),
            Text(
              'German bütel, Proto-West Germanic budil from Proto-Germanic budilaz, from Proto-Germanic beudaną',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Middle High German (MHG; endonym: diutsch or tiutsch; New High German: Mittelhochdeutsch, shortened as Mhdt. or Mhd.) is the term for the form of High German spoken in the High Middle Ages. ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              '\$2.0',
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
