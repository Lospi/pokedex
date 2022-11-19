import 'package:pokedex/domain/data/poke_api_provider.dart';

class NumberPagesUseCase {
  final PokeAPIProvider pokemonAPIProvider;

  NumberPagesUseCase(this.pokemonAPIProvider);

  Future<int> getTotalPageCount() async {
    final totalPokemonCount = await pokemonAPIProvider.getTotalPokemonCount();
    return (totalPokemonCount! ~/ 60).ceil();
  }
}
