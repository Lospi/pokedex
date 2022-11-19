import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/pokemon_pagination_cubit.dart';
import 'package:pokedex/widgets/pokemon_grid.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<PokemonPaginationCubit>()..getFirstPokemons(),
      child: const PokemonGrid(),
    );
  }
}
