import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokemon.dart';

class PokemonStatsBars extends StatelessWidget {
  const PokemonStatsBars({
    Key? key,
    required this.pokemonData,
  }) : super(key: key);

  final PokemonData pokemonData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            children: [
              for (var i = 0; i < pokemonData.stats.length; i++)
                Text(
                  pokemonData.stats[i].name.toUpperCase(),
                  style: TextStyle(
                      color: pokemonData.pokemonTypeColors.first,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
            ],
          ),
          Column(
            children: [
              for (var i = 0; i < pokemonData.stats.length; i++)
                const SizedBox(width: 24)
            ],
          ),
          Column(
            children: [
              for (var i = 0; i < pokemonData.stats.length; i++)
                Text(pokemonData.stats[i].value.toString()),
            ],
          ),
          Column(
            children: [
              for (var i = 0; i < pokemonData.stats.length; i++)
                const SizedBox(width: 16)
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = 0; i < pokemonData.stats.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: LinearProgressIndicator(
                        minHeight: 13,
                        backgroundColor: Colors.grey,
                        color: pokemonData.pokemonTypeColors.first,
                        semanticsLabel: 'Linear progress indicator',
                        value: pokemonData.stats[i].value / 248,
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
