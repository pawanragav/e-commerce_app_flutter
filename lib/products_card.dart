import "package:flutter/material.dart";

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 5),
            Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 5),
            Center(
              child: Image.asset(
                image,
                height: 175,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
