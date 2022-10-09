class PokemonDataAPI {
  final int pokemonId;
  final String pokemonName;
  final Map<String, dynamic> pokemonSprite;
  final List<dynamic> pokemonType;

  const PokemonDataAPI(
      {required this.pokemonId,
      required this.pokemonName,
      required this.pokemonSprite,
      required this.pokemonType});

  factory PokemonDataAPI.fromJson(Map<String, dynamic> json) {
    return PokemonDataAPI(
        pokemonId: json['id'],
        pokemonName: json['name'],
        pokemonSprite: json['sprites'],
        pokemonType: json['types']);
  }
}
