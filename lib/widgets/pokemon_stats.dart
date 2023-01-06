import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/utilities/capitalize_strings.dart';
import 'package:pokedex/widgets/pokemon_moves.dart';
import 'package:pokedex/widgets/pokemon_physical_attribute.dart';
import 'package:pokedex/widgets/pokemon_stats_bars.dart';

class PokemonStats extends StatelessWidget {
  final PokemonData pokemonData;
  final children = <Widget>[];

  PokemonStats({super.key, required this.pokemonData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: pokemonData.pokemonTypeColors.first,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: Text(
                '#${pokemonData.id}',
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
        title: Text(
          pokemonData.pokemonName.capitalize(),
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(8),
            child: Image.asset('images/PokeballTransparent.png'),
          ),
          Stack(
            fit: StackFit.expand,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 56),
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(
                    left: 4, bottom: 4, right: 4, top: 224),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < pokemonData.types.length; i++)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: pokemonData.pokemonTypeColors[i]),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            child: Text(
                              pokemonData.types[i].capitalize(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'About',
                      style: TextStyle(
                          color: pokemonData.pokemonTypeColors.first,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0;
                            i < pokemonData.physicalAttributes.length;
                            i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: PokemonPhysicalAttribute(
                              pokemonPhysicalAttribute:
                                  pokemonData.physicalAttributes[i],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: PokemonMoves(pokemonData: pokemonData),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Base Stats',
                      style: TextStyle(
                          color: pokemonData.pokemonTypeColors.first,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    PokemonStatsBars(pokemonData: pokemonData)
                  ],
                ),
              ),
              Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.all(128),
                  alignment: Alignment.topCenter,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.network(pokemonData.mainSpriteURL)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
