import 'package:flutter/material.dart';

class Pokemon extends StatelessWidget {
  const Pokemon({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 104,
        height: 112,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(252, 186, 3, 1),
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                "#004",
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: const Color.fromRGBO(252, 186, 3, 1),
              child: const Text("Charmander"),
            )
          ],
        ));
  }
}
