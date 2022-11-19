import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pagination_cubit.dart';

import 'pokemon_card.dart';
import 'pokemon_grid_appbar.dart';

class PokemonGrid extends StatelessWidget {
  const PokemonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GridAppBar(),
      body: BlocBuilder<PaginationCubit, int>(
        builder: (context, state) {
          return NotificationListener<ScrollEndNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification.metrics.pixels ==
                  scrollNotification.metrics.maxScrollExtent) {
                context.read<PaginationCubit>().increasePagination();
              }
              return true;
            },
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: state,
              itemBuilder: (BuildContext context, int index) {
                return Pokemon(index: index);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.93,
              ),
            ),
          );
        },
      ),
    );
  }
}
