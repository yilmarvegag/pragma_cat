import 'package:flutter/material.dart';
import 'package:pragma_cat/domain/entities/cats/breed_entity.dart';
import 'package:pragma_cat/presentation/views/screens/breed_detail.dart';
import 'package:pragma_cat/presentation/views/widgets/breed_image.dart';

class CardHome extends StatelessWidget {
  const CardHome({
    super.key,
    required this.breed,
    required this.imageUrl,
  });

  final BreedEntity breed;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[100],
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  breed.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BreedDetailScreen(
                          breadEntity: breed,
                          imageUrl: imageUrl,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'More..',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          BreadImage(imageUrl: imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Origin: ${breed.origin}'),
                Text('Intelligence: ${breed.intelligence}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
