import '../pokemon.dart';

abstract class PokeAPIProvider {
  Future<int?> getTotalPokemonCount();
  Future<List<PokemonData>> fetchPokemonPage(int page);
}
