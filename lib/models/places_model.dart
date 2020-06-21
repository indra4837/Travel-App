class Places {
  String image;
  String name;
  String description;

  Places({
    this.image,
    this.name,
    this.description
  });
}

List places_day1 = [
  Places(
    image: 'images/Rome/colosseum.jpg',
    name: 'Colosseum',
    description: 'Gladiator\'s area',
  ),
  Places(
    image: 'images/Rome/pantheon.jpg',
    name: 'Pantheon',
    description: 'Stone-walled columns',
  ),      
];

List places_day2 = [
Places(
    image: 'images/Rome/spanish-steps.jpg',
    name: 'Spanish Steps',
    description: 'Tourist attraction',
  ),
  Places(
    image: 'images/Rome/trevi-fountain.jpg',
    name: 'Trevi Fountain',
    description: 'Toss a coin to come back to Rome`',
  ),
];

List allPlaces = [
  places_day1,
  places_day2,
];