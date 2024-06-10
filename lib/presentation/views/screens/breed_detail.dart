import 'package:flutter/material.dart';
import 'package:pragma_cat/domain/entities/cats/breed_entity.dart';
import 'package:pragma_cat/presentation/views/widgets/breed_image.dart';

class BreedDetailScreen extends StatelessWidget {
  final BreedEntity breadEntity;
  final String imageUrl;

  const BreedDetailScreen({
    super.key,
    required this.breadEntity,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breadEntity.name),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     BlocProvider.of<CatListBloc>(context).add(NavigateBack());
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          BreadImage(imageUrl: imageUrl),
          const SizedBox(height: 50),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description: ${breadEntity.description}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Intelligence: ${breadEntity.intelligence}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Adaptability: ${breadEntity.adaptability}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Orign: ${breadEntity.origin}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Affection Level: ${breadEntity.affectionLevel}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Child Friendly: ${breadEntity.childFriendly}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Dog Friendly: ${breadEntity.dogFriendly}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Energy Level: ${breadEntity.energyLevel}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Energy Level: ${breadEntity.energyLevel}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Wikipedia description: ${breadEntity.wikipediaUrl}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Temperament: ${breadEntity.temperament}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Country Code: ${breadEntity.countryCode}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Imagen ID: ${breadEntity.referenceImageId}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
