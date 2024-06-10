import 'package:flutter/material.dart';
import 'package:pragma_cat/domain/entities/cats/breed_entity.dart';
import 'package:pragma_cat/domain/repositories/i_cat_repository.dart';
import 'package:pragma_cat/views/screens/breed_detail.dart';
import 'package:pragma_cat/views/widgets/breed_image.dart';

class BreedCard extends StatelessWidget {
  final BreedEntity breed;
  final ICatRepository catRepository;

  const BreedCard({
    Key? key,
    required this.breed,
    required this.catRepository,
  }) : super(key: key);

  Future<void> _navigateToDetail(BuildContext context) async {
    String imageUrl = '';
    if (breed.referenceImageId.isNotEmpty) {
      imageUrl = await catRepository.fetchBreedImage(breed.referenceImageId);
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BreedDetailScreen(
          breadEntity: breed,
          imageUrl: imageUrl,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12, // Color de fondo del card
      elevation: 1, // Elevación de la sombra
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Borde redondeado
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
                  onPressed: () => _navigateToDetail(context),
                  child: const Text(
                    'More..',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150, // Altura deseada para la imagen
            child: FutureBuilder<String>(
              future: breed.referenceImageId.isNotEmpty
                  ? catRepository.fetchBreedImage(breed.referenceImageId)
                  : Future.value(
                      ''), // If no reference image, return empty future
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return BreadImage(imageUrl: snapshot.data ?? '');
                }
              },
            ),
          ),
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
