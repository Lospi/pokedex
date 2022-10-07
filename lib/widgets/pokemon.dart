import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/domain/pokemon.dart';

Future<PokemonDataAPI> fetchPokemonData(int index) async {
  final response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/' + index.toString()));

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

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

class _PokemonState extends State<Pokemon> {
  late Future<PokemonDataAPI> futurePokemon = fetchPokemonData(widget.index);

  @override
  void initState() {
    futurePokemon = fetchPokemonData(widget.index + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(252, 186, 3, 1),
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: FutureBuilder<PokemonDataAPI>(
                  future: futurePokemon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text("#${snapshot.data!.pokemonId}");
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: FutureBuilder<PokemonDataAPI>(
                    future: futurePokemon,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Image.network(
                            snapshot.data!.pokemonSprite["front_default"]);
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    }),
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: const Color.fromRGBO(252, 186, 3, 1),
              child: FutureBuilder<PokemonDataAPI>(
                  future: futurePokemon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.pokemonName.capitalize(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }),
            )
          ],
        ));
  }
}
