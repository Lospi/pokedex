import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/domain/pokemon.dart';
import 'package:pokedex/domain/pokemon_type_colors.dart';

class PokemonStats extends StatefulWidget {
  final PokemonData pokemonDataAPI;

  const PokemonStats({super.key, required this.pokemonDataAPI});

  @override
  State<PokemonStats> createState() => _PokemonStats();
}

extension StringExtensionStats on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class _PokemonStats extends State<PokemonStats> {
  late PokemonData pokemonData;
  late int pokemonTypeCount;
  late int abilitiesCount;
  late int statsCount;
  final children = <Widget>[];
  final numberFormat = NumberFormat("######0.00");

  @override
  void initState() {
    super.initState();
    pokemonData = widget.pokemonDataAPI;
    pokemonTypeCount = pokemonData.types.length;
    abilitiesCount = pokemonData.abilities.length;
    statsCount = pokemonData.stats.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: PokemonTypeColors.getColorByType(pokemonData.types[0]),
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
                        for (var i = 0; i < pokemonTypeCount; i++)
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: PokemonTypeColors.getColorByType(
                                      pokemonData.types[i])),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Text(
                                pokemonData.types[i].capitalize(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'About',
                      style: TextStyle(
                          color: PokemonTypeColors.getColorByType(
                              pokemonData.types[0]),
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('images/Weight.png'),
                                const SizedBox(width: 8),
                                Text(
                                    '${numberFormat.format(pokemonData.weight / 10)} kg')
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Weight',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontFamily: 'Poppins'),
                            )
                          ],
                        ),
                        const SizedBox(width: 24),
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('images/Height.png'),
                                const SizedBox(width: 8),
                                Text(
                                    '${numberFormat.format(pokemonData.height / 10)} m')
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Height',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontFamily: 'Poppins'),
                            )
                          ],
                        ),
                        const SizedBox(width: 24),
                        Column(
                          children: [
                            for (var i = 0; i < abilitiesCount; i++)
                              Text(
                                pokemonData.abilities[i].capitalize(),
                                style: const TextStyle(fontSize: 12),
                              ),
                            const SizedBox(width: 4),
                            const Text(
                              'Moves',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Base Stats',
                      style: TextStyle(
                          color: PokemonTypeColors.getColorByType(
                              pokemonData.types[0]),
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              for (var i = 0; i < statsCount; i++)
                                Text(
                                  pokemonData.stats[i].name.toUpperCase(),
                                  style: TextStyle(
                                      color: PokemonTypeColors.getColorByType(
                                          pokemonData.types[0]),
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                            ],
                          ),
                          Column(
                            children: [
                              for (var i = 0; i < statsCount; i++)
                                const SizedBox(width: 24)
                            ],
                          ),
                          Column(
                            children: [
                              for (var i = 0; i < statsCount; i++)
                                Text(pokemonData.stats[i].value.toString()),
                            ],
                          ),
                          Column(
                            children: [
                              for (var i = 0; i < statsCount; i++)
                                const SizedBox(width: 16)
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                for (var i = 0; i < statsCount; i++)
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      child: LinearProgressIndicator(
                                        minHeight: 13,
                                        backgroundColor: Colors.grey,
                                        color: PokemonTypeColors.getColorByType(
                                            pokemonData.types[0]),
                                        semanticsLabel:
                                            'Linear progress indicator',
                                        value: pokemonData.stats[i].value / 248,
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
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