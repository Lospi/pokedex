import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pages/pokemon_list/cubit/pagination/pokemon_pagination_cubit.dart';
import 'package:pokedex/pages/pokemon_list/widgets/loading_pokemon_snack_bar.dart';
import 'package:pokedex/pages/pokemon_list/widgets/pokemon_card.dart';
import 'package:pokedex/pages/pokemon_list/widgets/pokemon_grid_appbar.dart';

class PokemonGrid extends StatelessWidget {
  const PokemonGrid({super.key});

  bool onScrollNotification(
    BuildContext context,
    ScrollNotification scrollNotification,
  ) {
    final cubit = context.read<PokemonPaginationCubit>();
    final currentState = cubit.state as PokemonPaginationSuccess;
    if (!currentState.isLoadingNextPage &&
        scrollNotification.metrics.pixels >=
            scrollNotification.metrics.maxScrollExtent * 0.95) {
      cubit.getNextPage();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          content: LoadingPokemonSnackBar(),
        ),
      );
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GridAppBar(),
      body: BlocBuilder<PokemonPaginationCubit, PokemonPaginationState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 800),
            child: state is PokemonPaginationSuccess
                ? NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) =>
                        onScrollNotification(context, scrollNotification),
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.pokemonList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final pokemonData = state.pokemonList[index];
                        return Pokemon(
                          key: ValueKey(pokemonData.id),
                          pokemonData: pokemonData,
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.93,
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}
