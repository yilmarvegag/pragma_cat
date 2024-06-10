import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_cat/domain/entities/cats/breed_entity.dart';
import 'package:pragma_cat/presentation/bloc/catlist/catlist_bloc.dart';
import 'package:pragma_cat/presentation/views/widgets/breed_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BreedEntity> _breeds = []; // Local state variable for filtered breeds
  List<BreedEntity> _allBreeds = []; // Local state variable for all breeds

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CatListBloc>().add(LoadCatList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatListBloc, CatListState>(
      builder: (context, state) {
        if (state is CatListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CatListError) {
          return Center(child: Text('Error: ${state.error}'));
          // } else if (state is CatListNavigating) {
          //   BreedEntity breed = state.breed;
          //   String imgUrl = state.imgUrl;
          //   return BreedDetailScreen(
          //     breadEntity: breed,
          //     imageUrl: imgUrl,
          //   );
        } else if (state is CatListLoaded) {
          if (_allBreeds.isEmpty) {
            _allBreeds = state.cats;
            _breeds = state.cats;
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Cat Breeds',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
              ),
              elevation: 0,
              leadingWidth: 70,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (query) {
                      final filteredBreeds = _allBreeds.where((breed) {
                        final nameLower = breed.name.toLowerCase();
                        final searchLower = query.toLowerCase();
                        return nameLower.contains(searchLower);
                      }).toList();

                      setState(() {
                        _breeds = filteredBreeds;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search by Name Cat...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 12.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontSize: 16.0,
                      ),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  _searchController.clear();
                                  _breeds = _allBreeds;
                                });
                              },
                            )
                          : null,
                    ),
                  ),
                ),
              ),
            ),
            body: _breeds.isNotEmpty
                ? ListView.builder(
                    itemCount: _breeds.length,
                    itemBuilder: (context, index) => BreedCard(
                      breed: _breeds[index],
                    ),
                  )
                : const Center(
                    child: Text(
                      'No breeds found',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
          );
        } else {
          return const Text('Unexpected state');
        }
      },
    );
  }
}
