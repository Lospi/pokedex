import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

class PokemonPhysicalAttribute extends StatelessWidget {
  const PokemonPhysicalAttribute({
    Key? key,
    required this.numberFormat,
    required this.pokemonPhysicalAttribute,
  }) : super(key: key);

  final NumberFormat numberFormat;
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
                '${numberFormat.format(pokemonPhysicalAttribute.attributeValue / 10)} kg')
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Weight',
          style: TextStyle(
              color: Colors.grey, fontSize: 10, fontFamily: 'Poppins'),
        )
      ],
    );
  }
}
