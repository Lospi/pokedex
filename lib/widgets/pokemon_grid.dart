import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon_pagination_cubit.dart';

import 'pokemon_card.dart';
import 'pokemon_grid_appbar.dart';

class PokemonGrid extends StatelessWidget {
  const PokemonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GridAppBar(),
      body: BlocBuilder<PokemonPaginationCubit, PokemonPaginationState>(
        builder: (context, state) {
          if (state is PokemonPaginationSuccess) {
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                final cubit = context.read<PokemonPaginationCubit>();
                final currentState = cubit.state as PokemonPaginationSuccess;
                if (!currentState.isLoadingNextPage &&
                    scrollNotification.metrics.pixels >=
                        scrollNotification.metrics.maxScrollExtent * 0.8) {
                  cubit.getNextPage();
                }
                return true;
              },
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: state.pokemonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Pokemon(
                    pokemonData: state.pokemonList[index],
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.93,
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
