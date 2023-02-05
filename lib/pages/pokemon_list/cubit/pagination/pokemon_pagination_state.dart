part of 'pokemon_pagination_cubit.dart';

abstract class PokemonPaginationState extends Equatable {
  const PokemonPaginationState();
}

class PokemonPaginationInitial extends PokemonPaginationState {
  @override
  List<Object> get props => [];
}

class PokemonPaginationLoading extends PokemonPaginationState {
  @override
  List<Object> get props => [];
}

class PokemonPaginationError extends PokemonPaginationState {
  @override
  List<Object> get props => [];
}

class PokemonPaginationSuccess extends PokemonPaginationState {
  final int totalPage;
  final int currentPage;
  final List<PokemonData> pokemonList;
  final bool isLoadingNextPage;

  const PokemonPaginationSuccess({
    required this.totalPage,
    required this.pokemonList,
    required this.currentPage,
    this.isLoadingNextPage = false,
  });

  PokemonPaginationSuccess copyWith({
    int? totalPage,
    int? currentPage,
    List<PokemonData>? pokemonList,
    bool? isLoadingNextPage,
  }) {
    return PokemonPaginationSuccess(
      totalPage: totalPage ?? this.totalPage,
      currentPage: currentPage ?? this.currentPage,
      pokemonList: pokemonList != null
          ? [...this.pokemonList, ...pokemonList]
          : this.pokemonList,
      isLoadingNextPage: isLoadingNextPage ?? this.isLoadingNextPage,
    );
  }

  @override
  List<Object> get props =>
      [totalPage, currentPage, pokemonList, isLoadingNextPage];
}
