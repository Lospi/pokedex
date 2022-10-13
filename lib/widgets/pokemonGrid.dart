import 'package:flutter/material.dart';

import 'pokemonCard.dart';

class PokemonGrid extends StatefulWidget {
  const PokemonGrid({super.key});

  @override
  State<PokemonGrid> createState() => PokemonGridWidget();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const PokemonGrid(),
    );
  }
}

class PokemonGridWidget extends State<PokemonGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: 'Pesquisar',
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontFamily: 'Poppins', fontSize: 14)),
            ),
          ),
        ),
        leading: const ImageIcon(
          AssetImage('images/Pokeball.png'),
          size: 24,
          color: Colors.black,
        ),
        title: const Text('Pokedex',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 201,
        itemBuilder: (BuildContext context, int index) {
          return Pokemon(index: index);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.93,
        ),
      ),
    );
  }
}
