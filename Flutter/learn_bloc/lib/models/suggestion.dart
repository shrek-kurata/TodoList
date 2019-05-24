import 'dart:collection';

import 'package:english_words/english_words.dart';

final Suggestion suggestion = Suggestion();

class Suggestion {
  final List<WordPair> _suggestedWords = <WordPair>[];

  Suggestion();

  Suggestion.clone(Suggestion suggestion) {
    _suggestedWords.addAll(suggestion._suggestedWords);
  }

  int get suggestionCount => _suggestedWords.length;

  UnmodifiableListView<WordPair> get suggestionWords =>
      UnmodifiableListView(_suggestedWords);

  @override
  String toString() => "$suggestionWords";

  void add(WordPair wordPair) => _updateCount(wordPair);

  void addMulti(List<WordPair> wordPairs) {
    for (int i = 0; i < wordPairs.length; i++) {
      return _updateCount(wordPairs[i]);
    }
  }

  void _updateCount(WordPair wordPair) {
    _suggestedWords.add(wordPair);
  }
}
