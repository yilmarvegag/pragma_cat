import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pragma_cat/data/datasources/remote/cat_remote_datasource.dart';
import 'package:pragma_cat/data/repository/cat_reposiroty_impl.dart';
import 'package:pragma_cat/domain/entities/cats/breed_entity.dart';
import 'package:pragma_cat/presentation/views/widgets/breed_card.dart';

void main() {
  testWidgets('BreedCard displays breed name', (WidgetTester tester) async {
    BreedEntity breed = BreedEntity(
      id: "bali",
      name: "Balinese",
      vetstreetUrl:
          "http://www.vetstreet.com/cats/balinese", // Assuming cfa_url is not relevant
      temperament: "Affectionate, Intelligent, Playful",
      origin: "United States",
      countryCodes: "US",
      countryCode: "US",
      description:
          "Balinese are curious, outgoing, intelligent cats with excellent communication skills. They are known for their chatty personalities and are always eager to tell you their views on life, love, and what you’ve served them for dinner. ",
      altNames: "Long-haired Siamese",
      adaptability: 5,
      affectionLevel: 5,
      childFriendly: 4,
      dogFriendly: 5,
      energyLevel: 5,
      grooming: 3,
      healthIssues: 3,
      intelligence: 5,
      sheddingLevel: 3,
      socialNeeds: 5,
      strangerFriendly: 5,
      vocalisation: 5,
      wikipediaUrl: "https://en.wikipedia.org/wiki/Balinese_(cat)",
      referenceImageId: "13MkvUreZ",
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BreedCard(breed: breed),
      ),
    ));

    expect(find.text('Balinese'), findsOneWidget);
  });
}
