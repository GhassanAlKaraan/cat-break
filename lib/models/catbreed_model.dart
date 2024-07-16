class CatBreed {
  String? id;
  String? name;
  String? temperament;
  String? origin;
  String? description;
  int? intelligence;
  String? referenceImageId;
  int? energyLevel;

  CatBreed(
      {this.id,
      this.name,
      this.temperament,
      this.origin,
      this.description,
      this.intelligence,
      this.referenceImageId,
      this.energyLevel
      });

  CatBreed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    temperament = json['temperament'];
    origin = json['origin'];
    description = json['description'];
    intelligence = json['intelligence'];
    referenceImageId = json['reference_image_id'];
    energyLevel = json['energy_level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['temperament'] = temperament;
    data['origin'] = origin;
    data['description'] = description;
    data['intelligence'] = intelligence;
    data['reference_image_id'] = referenceImageId;
    data['energy_level'] = energyLevel;
    return data;
  }
}


// Example JSON when calling: https://api.thecatapi.com/v1/breeds

// {
//     "id": "abys",
//     "name": "Abyssinian",
//     "temperament": "Active, Energetic, Independent, Intelligent, Gentle",
//     "origin": "Egypt",
//     "description": "The Abyssinian is easy to care for, and a joy to have in your home. They're affectionate cats and love both people and other animals.",
//     "intelligence": 5,
//     "reference_image_id": "0XYvRd7oD"
// }
