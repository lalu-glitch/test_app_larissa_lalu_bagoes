import 'package:flutter/material.dart';

import '../../../../data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product data;
  const ProductCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const .all(8),
      child: Padding(
        padding: const .all(12),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(
              height: 200,
              width: .infinity,
              child: Image.network(data.image, height: 150, fit: .contain),
            ),

            const SizedBox(height: 12),

            Text(
              data.title,
              maxLines: 2,
              overflow: .ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: .bold),
            ),
            const SizedBox(height: 8),

            Text(
              data.category,
              maxLines: 1,
              overflow: .ellipsis,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            Text(
              data.description,
              maxLines: 3,
              overflow: .ellipsis,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${data.price} ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: .bold,
                    color: Colors.green,
                  ),
                ),

                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      '${data.rating.rate}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${data.rating.count})',
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
