import 'package:flutter/material.dart';

class PokemonTypeText extends StatelessWidget {
  final String text;

  const PokemonTypeText(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
      decoration: BoxDecoration(
        color: Color(0x4DFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
