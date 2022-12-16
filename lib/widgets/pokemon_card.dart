import 'package:flutter/material.dart';
import 'package:pokedex/utilities/capitalize_strings.dart';
import 'package:pokedex/widgets/pokemon_stats.dart';

import '../domain/pokemon.dart';

class Pokemon extends StatelessWidget {
  final PokemonData pokemonData;

  const Pokemon({super.key, required this.pokemonData});

  void openStats(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PokemonStats(pokemonData: pokemonData)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: pokemonData.pokemonTypeColors.first),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: InkWell(
          onTap: () => openStats(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                child: Text("#${pokemonData.id}",
                    style: TextStyle(
                        color: pokemonData.pokemonTypeColors.first,
                        fontSize: 10)),
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
                color: pokemonData.pokemonTypeColors.first,
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
