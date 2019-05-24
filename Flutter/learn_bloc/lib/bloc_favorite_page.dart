import 'package:flutter/material.dart';
import 'package:learn_bloc/components/word_provider.dart';
import 'package:learn_bloc/models/word_item.dart';

class BlocFavoritePage extends StatelessWidget {
  BlocFavoritePage();

  static const routeName = "/favorite";

  @override
  Widget build(BuildContext context) {
    final word = WordProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("YourFavorite")),
      body: StreamBuilder<List<WordItem>>(
          stream: word.items,
          builder: (context, snapshot) {
            if (snapshot.data == null || snapshot.data.isEmpty) {
              return Center(child: Text("Empty"));
            }
            final tiles =
                snapshot.data.map((item) => ListTile(title: Text(item.name)));

            final divided =
                ListTile.divideTiles(context: context, tiles: tiles).toList();
            return ListView(children: divided);
          }),
    );
  }
}
