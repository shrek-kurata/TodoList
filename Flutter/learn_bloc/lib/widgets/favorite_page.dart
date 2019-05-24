import 'package:flutter/material.dart';
import 'package:learn_bloc/models/word.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage(this.word);
  final Word word;

  static const routeName = "/favorite";

  @override
  Widget build(BuildContext context) {
    final tiles = word.items.map((item) {
      return ListTile(title: Text(item.name));
    });
    final divided =
        ListTile.divideTiles(context: context, tiles: tiles).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("YourFavorite"),
      ),
      body: ListView(children: divided),
    );
  }
}
