import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:english_words/english_words.dart';
import 'package:learn_bloc/bloc_favorite_page.dart';
import 'package:learn_bloc/components/word_bloc.dart';
import 'package:learn_bloc/components/word_provider.dart';
import 'package:learn_bloc/models/suggestion.dart';
import 'package:learn_bloc/models/word_item.dart';
import 'package:learn_bloc/widgets/count_label.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WordProvider(
      child: MaterialApp(
          title: 'Startup Name Generator',
          theme: ThemeData(primaryColor: Colors.white),
          home: RondomWordsHomePage(),
          routes: <String, WidgetBuilder>{
            BlocFavoritePage.routeName: (context) => BlocFavoritePage()
          }),
    );
  }
}

class RondomWordsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordBloc = WordProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup text generator"),
        actions: <Widget>[
          StreamBuilder<int>(
            stream: wordBloc.itemCount,
            initialData: 0,
            builder: (context, snapshot) =>
                CountLabel(favoriteCount: snapshot.data),
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () =>
                Navigator.of(context).pushNamed(BlocFavoritePage.routeName),
          )
        ],
      ),
    );
  }
}

class WordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= suggestion.suggestionCount) {
          const addNum = 10;
          suggestion.addMulti(generateWordPairs().take(addNum).toList());
        }
        return _buildRow(
            WordProvider.of(context), suggestion.suggestionWords[index]);
      },
    );
  }

  Widget _buildRow(WordBloc word, WordPair pair) {
    return new StreamBuilder<List<WordItem>>(
        stream: word.items,
        builder: (_, snapshot) {
          if (snapshot.data == null || snapshot.data.isEmpty) {
            return _createWordListTile(word, false, pair.asPascalCase);
          } else {
            final addedWord = snapshot.data.map((item) {
              return item.name;
            });
            final alreadyAdded =
                addedWord.toString().contains(pair.asPascalCase);
            return _createWordListTile(word, alreadyAdded, pair.asPascalCase);
          }
        });
  }

  Widget _createWordListTile(WordBloc word, bool isFavorited, String title) {
    return ListTile(
      title: Text(title),
      trailing: Icon(
        isFavorited ? Icons.favorite : Icons.favorite_border,
        color: isFavorited ? Colors.red : null,
      ),
      onTap: () {
        if (isFavorited) {
          word.wordRemoval.add(WordRemoval(title));
        } else {
          word.wordAddiction.add(WordAddition(title));
        }
      },
    );
  }
}
