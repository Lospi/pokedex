import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

class PokemonPhysicalAttribute extends StatelessWidget {
  const PokemonPhysicalAttribute({
    Key? key,
    required this.pokemonPhysicalAttribute,
  }) : super(key: key);

  final PhysicalAttribute pokemonPhysicalAttribute;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            pokemonPhysicalAttribute.attributeIcon,
            const SizedBox(width: 8),
            Text(
              '${(pokemonPhysicalAttribute.attributeValue / 10).toStringAsFixed(2)} kg',
            )
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Weight',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
            fontFamily: 'Poppins',
          ),
        )
      ],
    );
  }
}
