import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/use_case/number_pages_use_case.dart';
import 'package:pokedex/domain/use_case/pokemon_list_use_case.dart';

import '../../../../domain/entities/pokemon.dart';

part 'pokemon_pagination_state.dart';

class PokemonPaginationCubit extends Cubit<PokemonPaginationState> {
  final PokemonListUseCase pokemonListUseCase;
  final NumberPagesUseCase numberPagesUseCase;

  PokemonPaginationCubit(this.pokemonListUseCase, this.numberPagesUseCase)
      : super(PokemonPaginationInitial());

  void getFirstPokemons() async {
    emit(PokemonPaginationLoading());
    late final int totalPageCount;
    late final List<PokemonData> pokemonList;

    await Future.wait([
      numberPagesUseCase
          .getTotalPageCount()
          .then((pageCount) => totalPageCount = pageCount),
      pokemonListUseCase
          .getPokemonList(1)
          .then((firstPokemonPage) => pokemonList = firstPokemonPage),
    ]);

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
    emit(currentState.copyWith(isLoadingNextPage: true));
    final nextPage = currentState.currentPage + 1;
    final pokemonList = await pokemonListUseCase.getPokemonList(nextPage);
    emit(currentState.copyWith(
        isLoadingNextPage: false,
        pokemonList: pokemonList,
        currentPage: nextPage));
  }
}
