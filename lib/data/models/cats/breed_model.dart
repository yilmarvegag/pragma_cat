import 'package:pragma_cat/domain/entities/cats/breed_entity.dart';

class BreedModel extends BreedEntity {
  final String id;
  final String name;
  final String vetstreetUrl;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String description;
  final String altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final String referenceImageId;
  final String wikipediaUrl;
  final String imageUrl;

  BreedModel({
    required this.id,
    required this.name,
    required this.vetstreetUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.referenceImageId,
    required this.wikipediaUrl,
    required this.imageUrl,
  }) : super(
          id: id,
          name: name,
          vetstreetUrl: vetstreetUrl,
          temperament: temperament,
          origin: origin,
          countryCodes: countryCodes,
          countryCode: countryCode,
          description: description,
          altNames: altNames,
          adaptability: adaptability,
          affectionLevel: affectionLevel,
          childFriendly: childFriendly,
          dogFriendly: dogFriendly,
          energyLevel: energyLevel,
          grooming: grooming,
          healthIssues: healthIssues,
          intelligence: intelligence,
          sheddingLevel: sheddingLevel,
          socialNeeds: socialNeeds,
          strangerFriendly: strangerFriendly,
          vocalisation: vocalisation,
          referenceImageId: referenceImageId,
          wikipediaUrl: wikipediaUrl,
          imageUrl: imageUrl,
        );

  factory BreedModel.fromMap(Map<String, dynamic> json) => BreedModel(
        id: json["id"],
        name: json["name"],
        vetstreetUrl: json["vetstreet_url"] ?? "",
        temperament: json["temperament"],
        origin: json["origin"],
        countryCodes: json["country_codes"],
        countryCode: json["country_code"],
        description: json["description"],
        altNames: json["alt_names"] ?? "",
        adaptability: json["adaptability"],
        affectionLevel: json["affection_level"],
        childFriendly: json["child_friendly"],
        dogFriendly: json["dog_friendly"],
        energyLevel: json["energy_level"],
        grooming: json["grooming"],
        healthIssues: json["health_issues"],
        intelligence: json["intelligence"],
        sheddingLevel: json["shedding_level"],
        socialNeeds: json["social_needs"],
        strangerFriendly: json["stranger_friendly"],
        vocalisation: json["vocalisation"],
        referenceImageId: json["reference_image_id"] ?? "",
        wikipediaUrl: json["wikipedia_url"] ?? "",
        imageUrl: '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "vetstreet_url": vetstreetUrl,
        "temperament": temperament,
        "origin": origin,
        "country_codes": countryCodes,
        "country_code": countryCode,
        "description": description,
        "alt_names": altNames,
        "adaptability": adaptability,
        "affection_level": affectionLevel,
        "child_friendly": childFriendly,
        "dog_friendly": dogFriendly,
        "energy_level": energyLevel,
        "grooming": grooming,
        "health_issues": healthIssues,
        "intelligence": intelligence,
        "shedding_level": sheddingLevel,
        "social_needs": socialNeeds,
        "stranger_friendly": strangerFriendly,
        "vocalisation": vocalisation,
        "reference_image_id": referenceImageId,
        "wikipedia_url": wikipediaUrl,
      };
}
