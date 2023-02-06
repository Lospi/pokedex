import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/pages/pokemon_list/cubit/pagination/pokemon_pagination_cubit.dart';

import '../../../mocks.dart';

void main() {
  final pokemonListUseCase = PokemonListUseCaseMock();
  final numberPagesUseCase = NumberPagesUseCaseMock();

  tearDown(() {
    reset(pokemonListUseCase);
    reset(numberPagesUseCase);
  });

  group('GetFirstPokemons', () {
    blocTest<PokemonPaginationCubit, PokemonPaginationState>(
      "If GetFirstPokemons return successfully PokemonList, emit success state",
      build: () => PokemonPaginationCubit(
        pokemonListUseCase,
        numberPagesUseCase,
      ),
      act: (cubit) => cubit.getFirstPokemons(),
      expect: () => [
        PokemonPaginationLoading(),
        const PokemonPaginationSuccess(
          totalPage: 1,
          currentPage: 1,
          pokemonList: [],
        ),
      ],
      setUp: () {
        when(() => numberPagesUseCase.getTotalPageCount())
            .thenAnswer((_) async => 1);
        when(() => pokemonListUseCase.getPokemonList(1))
            .thenAnswer((_) async => []);
      },
      verify: (_) {
        verify(() => numberPagesUseCase.getTotalPageCount()).called(1);
        verify(() => pokemonListUseCase.getPokemonList(1)).called(1);
      },
    );

    blocTest<PokemonPaginationCubit, PokemonPaginationState>(
      "If PokemonListUseCase throws exception, emit error state",
      build: () => PokemonPaginationCubit(
        pokemonListUseCase,
        numberPagesUseCase,
      ),
      act: (cubit) => cubit.getFirstPokemons(),
      expect: () => [
        PokemonPaginationLoading(),
        PokemonPaginationError(),
      ],
      setUp: () {
        when(() => numberPagesUseCase.getTotalPageCount())
            .thenAnswer((_) async => 1);
        when(() => pokemonListUseCase.getPokemonList(1))
            .thenAnswer((_) => Future.error(Exception()));
      },
      verify: (_) {
        verify(() => numberPagesUseCase.getTotalPageCount()).called(1);
        verify(() => pokemonListUseCase.getPokemonList(1)).called(1);
      },
    );
  });

  group('GetNextPage', () {
    blocTest<PokemonPaginationCubit, PokemonPaginationState>(
      "If GetPokemonList return successfully PokemonList, emit success state",
      build: () => PokemonPaginationCubit(
        pokemonListUseCase,
        numberPagesUseCase,
      ),
      seed: () => const PokemonPaginationSuccess(
        totalPage: 2,
        currentPage: 1,
        pokemonList: [],
      ),
      act: (cubit) => cubit.getNextPage(),
      expect: () => [
        const PokemonPaginationSuccess(
            totalPage: 2,
            currentPage: 1,
            pokemonList: [],
            isLoadingNextPage: true),
        const PokemonPaginationSuccess(
          totalPage: 2,
          currentPage: 2,
          pokemonList: [],
        ),
      ],
      setUp: () {
        when(() => pokemonListUseCase.getPokemonList(2))
            .thenAnswer((_) async => []);
      },
      verify: (_) {
        verifyNever(() => numberPagesUseCase.getTotalPageCount());
        verify(() => pokemonListUseCase.getPokemonList(2)).called(1);
      },
    );

    blocTest<PokemonPaginationCubit, PokemonPaginationState>(
      "If PokemonListUseCase throws exception, emit error state",
      build: () => PokemonPaginationCubit(
        pokemonListUseCase,
        numberPagesUseCase,
      ),
      act: (cubit) => cubit.getNextPage(),
      expect: () => [
        const PokemonPaginationSuccess(
            totalPage: 2,
            currentPage: 1,
            pokemonList: [],
            isLoadingNextPage: true),
        PokemonPaginationError(),
      ],
      seed: () => const PokemonPaginationSuccess(
        totalPage: 2,
        currentPage: 1,
        pokemonList: [],
      ),
      setUp: () {
        when(() => pokemonListUseCase.getPokemonList(2))
            .thenAnswer((_) => Future.error(Exception()));
      },
      verify: (_) {
        verify(() => pokemonListUseCase.getPokemonList(2)).called(1);
      },
    );
  });
}
