import 'package:flutter/material.dart';
import 'package:pokedex/domain/pokemon_type_colors.dart';
import 'package:pokedex/widgets/pokemon_stats.dart';

import '../domain/pokemon.dart';

class Pokemon extends StatelessWidget {
  final PokemonData pokemonData;

  const Pokemon({super.key, required this.pokemonData});

  @override
  Widget build(BuildContext context) {
    final pokemonColor =
        PokemonTypeColors.getColorByType(pokemonData.types[0])!;
    return Card(
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: pokemonColor),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PokemonStats(pokemonData: pokemonData)));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                child: Text("#${pokemonData.id}",
                    style: TextStyle(color: pokemonColor, fontSize: 10)),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Image.network(
                    pokemonData.mainSpriteURL,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: pokemonColor,
                child: Text(
                  pokemonData.pokemonName.capitalize(),
                  style: const TextStyle(
                      color: Colors.white, fontFamily: 'Poppins', fontSize: 10),
                ),
              )
            ],
          ),
        ));
  }
}
