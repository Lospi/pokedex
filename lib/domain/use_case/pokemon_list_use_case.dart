import 'package:get_it/get_it.dart';
import 'package:pokedex/domain/data/poke_api_provider.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

class PokemonListUseCase {
  final PokeAPIProvider provider;

  const PokemonListUseCase({required this.provider});

  Future<List<PokemonData>> getPokemonList(int page) {
    final pokemonList = GetIt.I.get<PokeAPIProvider>().fetchPokemonPage(page);
    return pokemonList;
  }
}
