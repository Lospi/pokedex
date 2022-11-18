import 'dart:ui';

class PokemonTypeColors {
  static Map<String, Color> colorByType = const {
    'normal': Color.fromARGB(255, 168, 167, 122),
    'fire': Color.fromARGB(255, 238, 129, 48),
    'water': Color.fromARGB(255, 99, 144, 240),
    'electric': Color.fromARGB(255, 247, 208, 44),
    'grass': Color.fromARGB(255, 122, 199, 76),
    'ice': Color.fromARGB(255, 150, 217, 214),
    'fighting': Color.fromARGB(255, 194, 46, 40),
    'poison': Color.fromARGB(255, 163, 62, 161),
    'ground': Color.fromARGB(255, 226, 191, 101),
    'flying': Color.fromARGB(255, 169, 143, 243),
    'psychic': Color.fromARGB(255, 249, 85, 135),
    'bug': Color.fromARGB(255, 166, 185, 26),
    'rock': Color.fromARGB(255, 182, 161, 54),
    'ghost': Color.fromARGB(255, 115, 87, 151),
    'dragon': Color.fromARGB(255, 111, 53, 252),
    'dark': Color.fromARGB(255, 112, 87, 70),
    'steel': Color.fromARGB(255, 183, 183, 206),
    'fairy': Color.fromARGB(255, 214, 133, 173),
  };

  static Color? getColorByType(String type) {
    return colorByType[type];
  }
}
