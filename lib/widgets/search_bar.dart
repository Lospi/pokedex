import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/search_cubit.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: 'Pesquisar',
            hintStyle: const TextStyle(
                color: Colors.grey, fontFamily: 'Poppins', fontSize: 14)),
      ),
    );
  }
}
