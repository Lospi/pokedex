import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pagination_cubit.dart';
import 'package:pokedex/widgets/pokemon_grid.dart';

class GridPage extends StatelessWidget {
  /// {@macro counter_page}
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaginationCubit(),
      child: const PokemonGrid(),
    );
  }
}
