import 'package:flutter/material.dart';

import 'pokemon_card.dart';

class PokemonGrid extends StatefulWidget {
  const PokemonGrid({super.key});

  @override
  State<PokemonGrid> createState() => PokemonGridWidget();
}

class PokemonGridWidget extends State<PokemonGrid> {
  int loadedPokemonCount = 18;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GridAppBar(),
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.pixels ==
              scrollNotification.metrics.maxScrollExtent) {
            setState(() {
              loadedPokemonCount += 18;
            });
          }
          return true;
        },
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: loadedPokemonCount,
          itemBuilder: (BuildContext context, int index) {
            return Pokemon(index: index);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.93,
          ),
        ),
      ),
    );
  }
}

class GridAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GridAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
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
      title: const Text(
        'Pokedex',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
}
