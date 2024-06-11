import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_cat/domain/entities/cats/breed_entity.dart';
import 'package:pragma_cat/domain/repositories/i_cat_repository.dart';
import 'package:pragma_cat/presentation/bloc/catimage/catimage_bloc.dart';
import 'package:pragma_cat/presentation/views/widgets/card_home.dart';

class BreedCard extends StatelessWidget {
  final BreedEntity breed;

  const BreedCard({
    Key? key,
    required this.breed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatImageBloc(context.read<ICatRepository>())
        ..add(LoadCatImage(breed.referenceImageId)),
      child: BlocBuilder<CatImageBloc, CatImageState>(
        builder: (context, state) {
          if (state is CatImageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CatImageError) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state is CatImageLoaded) {
            // imageUrl = state.imageUrl;
            return CardHome(
              breed: breed,
              imageUrl: state.imageUrl,
            );
          } else {
            return const Center(child: Text('No image available'));
          }
        },
      ),
    );
  }
}
