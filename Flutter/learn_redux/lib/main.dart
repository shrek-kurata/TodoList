import 'package:flutter/material.dart';
import 'package:learn_redux/state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Store<AppState> store = Store(reducer, initialState: AppState(0), middleware: [middleWare]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Learn Redux'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              StoreConnector(
                converter: (Store<AppState> store) => store.state.counter,
                builder: (context, counter) => Text(
                      '$counter',
                      style: Theme.of(context).textTheme.display1,
                    ),
              )
            ],
          ),
        ),
        floatingActionButton: StoreConnector(
            converter: (Store<AppState> store) {
              return () => store.dispatch(Actions.Increment);
            },
            builder: (context, callback) => FloatingActionButton(
                  onPressed: callback,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                )),
      ),
    );
  }
}
