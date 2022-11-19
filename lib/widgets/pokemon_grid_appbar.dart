import 'package:flutter/material.dart';

import 'search_bar.dart';

class GridAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GridAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: SearchBar(),
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
