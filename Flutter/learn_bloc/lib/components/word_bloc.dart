import 'package:learn_bloc/models/word.dart';
import 'package:learn_bloc/models/word_item.dart';
import 'package:rxdart/subjects.dart';
import 'dart:async';

class WordAddition {
  final String name;
  WordAddition(this.name);
}

class WordRemoval {
  final String name;
  WordRemoval(this.name);
}

class WordBloc {
  final Word _word = Word();

  final BehaviorSubject<List<WordItem>> _items =
      BehaviorSubject<List<WordItem>>.seeded([]);

  final BehaviorSubject<int> _itemCount = BehaviorSubject<int>.seeded(0);

  final StreamController<WordAddition> _wordActionController =
      StreamController<WordAddition>();

  final StreamController<WordRemoval> _wordRemovalController =
      StreamController<WordRemoval>();

  WordBloc() {
    _wordActionController.stream.listen((addition) {
      int currentCount = _word.itemCount;
      _word.add(addition.name);
      _items.add(_word.items);
      int updateCount = _word.itemCount;
      if (updateCount != currentCount) {
        _itemCount.add(updateCount);
      }
    });

    _wordRemovalController.stream.listen((removal) {
      int currentCount = _word.itemCount;
      _word.remove(removal.name);
      print(_word.items.toString());
      _items.add(_word.items);
      int updateCount = _word.itemCount;
      if (updateCount != currentCount) {
        _itemCount.add(updateCount);
      }
    });
  }

  Sink<WordAddition> get wordAddiction => _wordActionController.sink;
  Sink<WordRemoval> get wordRemoval => _wordRemovalController.sink;

  Stream<int> get itemCount => _itemCount.stream;
  Stream<List<WordItem>> get items => _items.stream;

  void dispose() {
    _items.close();
    _itemCount.close();
    _wordActionController.close();
    _wordRemovalController.close();
  }
}
