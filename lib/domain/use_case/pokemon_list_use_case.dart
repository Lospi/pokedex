import 'package:pokedex/data/pokemon_api_provider.dart';
import 'package:pokedex/domain/data/poke_api_provider.dart';
import 'package:pokedex/domain/pokemon.dart';

class PokemonListUseCase {
  final PokeAPIProvider provider;

  const PokemonListUseCase({required this.provider});

  Future<List<PokemonData>> getPokemonList(int page) {
    final pokemonList = PokemonAPIProviderImpl().fetchPokemonPage(page);
    return pokemonList;
  }
}
