import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/use_case/number_pages_use_case.dart';
import 'package:pokedex/domain/use_case/pokemon_list_use_case.dart';

import 'domain/pokemon.dart';

part 'pokemon_pagination_state.dart';

class PokemonPaginationCubit extends Cubit<PokemonPaginationState> {
  final PokemonListUseCase pokemonListUseCase;
  final NumberPagesUseCase numberPagesUseCase;

  PokemonPaginationCubit(this.pokemonListUseCase, this.numberPagesUseCase)
      : super(PokemonPaginationInitial());

  void getFirstPokemons() async {
    emit(PokemonPaginationLoading());
    final totalPageCount = await numberPagesUseCase.getTotalPageCount();
    final pokemonList = await pokemonListUseCase.getPokemonList(1);
    emit(
      PokemonPaginationSuccess(
        totalPage: totalPageCount,
        currentPage: 1,
        pokemonList: pokemonList,
      ),
    );
  }

  void getNextPage() async {
    final currentState = state as PokemonPaginationSuccess;
    print(currentState.isLoadingNextPage);
    emit(currentState.copyWith(isLoadingNextPage: true));
    print((state as PokemonPaginationSuccess).isLoadingNextPage);
    final nextPage = currentState.currentPage + 1;
    final pokemonList = await pokemonListUseCase.getPokemonList(nextPage);
    emit(currentState.copyWith(
        isLoadingNextPage: false,
        pokemonList: pokemonList,
        currentPage: nextPage));
    print((state as PokemonPaginationSuccess).isLoadingNextPage);
  }
}
