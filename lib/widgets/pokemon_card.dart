import 'package:flutter/material.dart';
import 'package:pokedex/data/fetch_pokemon_data.dart';
import 'package:pokedex/domain/pokemon_type_colors.dart';
import 'package:pokedex/widgets/pokemon_stats.dart';

import '../domain/pokemon.dart';

class Pokemon extends StatefulWidget {
  final int index;

  const Pokemon({super.key, required this.index});

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  late Future<PokemonData> futurePokemon = fetchPokemonData(widget.index + 1);
  Color pokemonColor = Colors.green;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemonData(widget.index + 1);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonData>(
        future: futurePokemon,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var pokemon = snapshot.data!;
            pokemonColor = PokemonTypeColors.getColorByType(pokemon.types[0])!;
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
                                PokemonStats(pokemonDataAPI: pokemon)));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Text("#${pokemon.id}",
                            style:
                                TextStyle(color: pokemonColor, fontSize: 10)),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Image.network(
                            pokemon.mainSpriteURL,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        color: pokemonColor,
                        child: Text(
                          pokemon.pokemonName.capitalize(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }
}
