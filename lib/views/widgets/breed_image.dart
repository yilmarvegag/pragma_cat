import 'package:flutter/material.dart';

class BreadImage extends StatelessWidget {
  final String imageUrl;

  const BreadImage({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty
        ? Image.network(
            imageUrl,
            height: 300,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return const Center(child: Text('Failed to load image'));
            },
          )
        : const Center(
            child: Text('No image available'),
          );
  }
}
