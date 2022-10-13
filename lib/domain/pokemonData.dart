import 'package:pokedex/domain/pokemonAPI.dart';

class PokemonData {
  late int weight;
  late int height;
  late List<dynamic> moves;
  late List<dynamic> stats;
  late List<dynamic> types;
  final PokemonDataAPI pokemonDataAPI;

  PokemonData({required this.pokemonDataAPI});

  void ConstructData() {
    weight = pokemonDataAPI.pokemonWeight;
    height = pokemonDataAPI.pokemonHeight;
    moves = pokemonDataAPI.pokemonAbilities;
    stats = pokemonDataAPI.pokemonStats;
    types = pokemonDataAPI.pokemonTypes;
  }

  String getMainType(String type) {
    return types[0]['name'];
  }
}
