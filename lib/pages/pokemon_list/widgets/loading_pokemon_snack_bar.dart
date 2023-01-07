import 'package:flutter/material.dart';

class LoadingPokemonSnackBar extends StatelessWidget {
  const LoadingPokemonSnackBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: CircularProgressIndicator(),
        ),
        Text(
          "Loading more pokemons",
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
