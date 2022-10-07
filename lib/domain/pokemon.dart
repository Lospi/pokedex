class PokemonDataAPI {
  final int pokemonId;
  final String pokemonName;
  final Map<String, dynamic> pokemonSprite;

  const PokemonDataAPI(
      {required this.pokemonId,
      required this.pokemonName,
      required this.pokemonSprite});

  factory PokemonDataAPI.fromJson(Map<String, dynamic> json) {
    return PokemonDataAPI(
        pokemonId: json['id'],
        pokemonName: json['name'],
        pokemonSprite: json['sprites']);
  }
}
