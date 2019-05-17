import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gettogether',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Gettogether'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
                fontFamily: 'Avenir', fontSize: 20, color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: Color.fromRGBO(157, 232, 104, 1),
        ),
        body: Column(
          children: <Widget>[_banner(), _eventListsContainer()],
        ));
  }

  Widget _banner() {
    return Container(
        height: 285,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(height: 200),
            RaisedButton(
                onPressed: () {},
                color: Color.fromRGBO(157, 232, 104, 1),
                textColor: Colors.white,
                child: Text('スポーツする仲間を見つけよう'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)))),
          ],
        ));
  }

  Widget _eventListsContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
