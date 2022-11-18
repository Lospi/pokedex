class Stat {
  final int value;
  final String name;

  Stat({
    required this.value,
    required this.name,
  });
}

class PokemonData {
  final String pokemonName;
  final List<String> abilities;
  final int id;
  final double weight;
  final double height;
  final List<Stat> stats;
  final List<String> types;
  final String mainSpriteURL;

  PokemonData(
      {required this.abilities,
      required this.id,
      required this.height,
      required this.weight,
      required this.stats,
      required this.types,
      required this.mainSpriteURL,
      required this.pokemonName});
}
