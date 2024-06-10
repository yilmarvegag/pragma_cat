import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_cat/domain/entities/cats/breed_entity.dart';
import 'package:pragma_cat/domain/repositories/i_cat_repository.dart';
import 'package:pragma_cat/presentation/bloc/catimage/catimage_bloc.dart';
import 'package:pragma_cat/presentation/bloc/catlist/catlist_bloc.dart';
import 'package:pragma_cat/presentation/views/screens/breed_detail.dart';
import 'package:pragma_cat/presentation/views/widgets/breed_image.dart';

class BreedCard extends StatelessWidget {
  final BreedEntity breed;

  const BreedCard({
    Key? key,
    required this.breed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    return BlocProvider(
      create: (context) => CatImageBloc(context.read<ICatRepository>())
        ..add(LoadCatImage(breed.referenceImageId)),
      child: Card(
        color: Colors.blue[100], // Color de fondo del card
        elevation: 4, // Elevación de la sombra
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
            SizedBox(
              height: 450, // Altura deseada para la imagen
              child: BlocBuilder<CatImageBloc, CatImageState>(
                builder: (context, state) {
                  if (state is CatImageLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CatImageError) {
                    return Center(child: Text('Error: ${state.error}'));
                  } else if (state is CatImageLoaded) {
                    imageUrl = state.imageUrl;
                    return BreadImage(imageUrl: imageUrl);
                  } else {
                    return const Center(child: Text('No image available'));
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
      ),
    );
  }
}
