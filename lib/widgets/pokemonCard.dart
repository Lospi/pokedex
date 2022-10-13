import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/domain/pokemonAPI.dart';
import 'package:pokedex/domain/pokemonTypeColors.dart';
import 'package:pokedex/widgets/pokemonStats.dart';

Future<PokemonDataAPI> fetchPokemonData(int index) async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$index'));

  if (response.statusCode == 200) {
    return PokemonDataAPI.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Pokemon');
  }
}

class Pokemon extends StatefulWidget {
  final int index;

  const Pokemon({super.key, required this.index});

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  late Future<PokemonDataAPI> futurePokemon =
      fetchPokemonData(widget.index + 1);
  Color pokemonColor = Colors.green;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemonData(widget.index + 1);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonDataAPI>(
        future: futurePokemon,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var pokemon = snapshot.data!;
            pokemonColor =
                PokemonTypeColors.getColorByType(pokemon.getMainType())!;
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
                        child: Text("#${pokemon.pokemonId}",
                            style:
                                TextStyle(color: pokemonColor, fontSize: 10)),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Image.network(
                            pokemon.getMainPokemonSprite(),
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
