class PokemonDataAPI {
  final int pokemonId;
  final String pokemonName;
  final Map<String, dynamic> pokemonSprite;
  final List<dynamic> pokemonTypes;
  final List<dynamic> pokemonStats;
  final List<dynamic> pokemonAbilities;
  final int pokemonWeight;
  final int pokemonHeight;

  const PokemonDataAPI(
      {required this.pokemonId,
      required this.pokemonName,
      required this.pokemonSprite,
      required this.pokemonTypes,
      required this.pokemonStats,
      required this.pokemonWeight,
      required this.pokemonHeight,
      required this.pokemonAbilities});

  String getTypeNameByIndex(int index) {
    return pokemonTypes[index]['type']['name'];
  }

  String getMainType() {
    return pokemonTypes[0]['type']['name'];
  }

  String getMainPokemonSprite() {
    return pokemonSprite["front_default"];
  }

  String getPokemonAbilityByIndex(int index) {
    return pokemonAbilities[index]['ability']['name'];
  }

  String getPokemonStatNameByIndex(int index) {
    return pokemonStats[index]['stat']['name'];
  }

  int getPokemonStatByIndex(int index) {
    return pokemonStats[index]['base_stat'];
  }

  factory PokemonDataAPI.fromJson(Map<String, dynamic> json) {
    return PokemonDataAPI(
        pokemonId: json['id'],
        pokemonName: json['name'],
        pokemonSprite: json['sprites'],
        pokemonTypes: json['types'],
        pokemonStats: json['stats'],
        pokemonWeight: json['weight'],
        pokemonHeight: json['height'],
        pokemonAbilities: json['abilities']);
  }
}
