import 'package:flutter/material.dart';
import 'package:pragma_cat/domain/entities/cats/breed_entity.dart';
import 'package:pragma_cat/domain/repositories/i_cat_repository.dart';
import 'package:pragma_cat/views/widgets/breed_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catRepository = context.read<ICatRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Breeds'),
        elevation: 0,
        leadingWidth: 70,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await catRepository.getAllBreeds();
        },
        child: FutureBuilder<List<BreedEntity>>(
          future: catRepository.getAllBreeds(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No breeds found'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return BreedCard(
                    breed: snapshot.data![index],
                    catRepository: catRepository,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
