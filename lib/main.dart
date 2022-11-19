import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokedex_observer.dart';
import 'package:pokedex/setup.dart';
import 'package:pokedex/utilities/json_decode_helper.dart';

import 'app.dart';

void main() async {
  await JsonDecoderHelper.instance.awaitForInitialization;
  Bloc.observer = PokedexObserver();
  setup();
  runApp(const MyApp());
}
