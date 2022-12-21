import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/utilities/capitalize_strings.dart';

class PokemonMoves extends StatelessWidget {
  const PokemonMoves({
    Key? key,
    required this.pokemonData,
  }) : super(key: key);

  final PokemonData pokemonData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < pokemonData.abilities.length; i++)
          Text(
            pokemonData.abilities[i].capitalize(),
            style: const TextStyle(fontSize: 12),
          ),
        const SizedBox(width: 4),
        const Text(
          'Moves',
          style: TextStyle(
              color: Colors.grey, fontSize: 10, fontFamily: 'Poppins'),
        ),
      ],
    );
  }
}
