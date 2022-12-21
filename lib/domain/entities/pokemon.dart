import 'package:flutter/material.dart';

class Stat {
  final int value;
  final String name;

  Stat({
    required this.value,
    required this.name,
  });
}

class PhysicalAttribute {
  final String attribute;
  final double attributeValue;
  final Image attributeIcon;

  PhysicalAttribute({
    required this.attribute,
    required this.attributeValue,
    required this.attributeIcon,
  });
}

class PokemonData {
  final String pokemonName;
  final List<String> abilities;
  final int id;
  final List<PhysicalAttribute> physicalAttributes;
  final List<Stat> stats;
  final List<String> types;
  final String mainSpriteURL;
  final List<Color> pokemonTypeColors;

  PokemonData(
      {required this.abilities,
      required this.id,
      required this.physicalAttributes,
      required this.stats,
      required this.types,
      required this.mainSpriteURL,
      required this.pokemonName,
      required this.pokemonTypeColors});
}
