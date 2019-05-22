import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

@immutable
class AppState {
  final int counter;
  AppState(this.counter);
}

enum Actions { Increment }

AppState reducer(AppState prevState, action) {
  if (action == Actions.Increment) {
    return AppState(prevState.counter + 1);
  }
  return prevState;
}

void middleWare(Store<AppState> store, action, NextDispatcher next) async {
  if (action == Actions.Increment) {
    print('今は${store.state.counter}です。+1するよ');
  }
  next(action);
  if (action == Actions.Increment) {
    print('${store.state.counter}になったよ');
  }
}
