import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokedex_observer.dart';

import 'app.dart';

void main() {
  Bloc.observer = PokedexObserver();
  runApp(const MyApp());
}
