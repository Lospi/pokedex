import 'package:flutter/material.dart';

class GridAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GridAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
