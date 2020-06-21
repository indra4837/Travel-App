class Destination {
  String image;
  String city;
  String country;
  String description;

  Destination({
    this.image,
    this.city,
    this.country,
    this.description
  });
}

List destinations = [
  Destination(
    image: 'images/Melbourne.jpg',
    city: 'Melbourne',
    country: 'Australia',
    description: 'Brilliant coastal drive',
  ),
  Destination(
    image: 'images/Paris.jpg',
    city: 'Paris',
    country: 'France',
    description: 'City of love',
  ),
  Destination(
    image: 'images/Rome.jpg',
    city: 'Rome',
    country: 'Italy',
    description: 'Gladiators of Ancient Rome',
  ),
  Destination(
    image: 'images/Venice.jpg',
    city: 'Venice',
    country: 'Italy',
    description: 'A sinking city',
  ),      
];