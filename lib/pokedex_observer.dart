import 'package:bloc/bloc.dart';
import 'package:pokedex/pokemon_pagination_cubit.dart';

class PokedexObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (change.nextState is PokemonPaginationSuccess) {
      //print((change.nextState as PokemonPaginationSuccess).isLoadingNextPage);
    }
  }
}
