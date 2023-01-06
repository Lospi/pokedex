import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pages/pokemon_list/cubit/pagination/pokemon_pagination_cubit.dart';
import 'package:pokedex/pages/pokemon_list/widgets/pokemon_card.dart';
import 'package:pokedex/pages/pokemon_list/widgets/pokemon_grid_appbar.dart';

class PokemonGrid extends StatelessWidget {
  const PokemonGrid({super.key});

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
                    onNotification: (scrollNotification) {
                      final cubit = context.read<PokemonPaginationCubit>();
                      final currentState =
                          cubit.state as PokemonPaginationSuccess;
                      if (!currentState.isLoadingNextPage &&
                          scrollNotification.metrics.pixels >=
                              scrollNotification.metrics.maxScrollExtent *
                                  0.95) {
                        cubit.getNextPage();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 2),
                            content: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 8),
                                  child: CircularProgressIndicator(),
                                ),
                                Text(
                                  "Loading more pokemons",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
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
