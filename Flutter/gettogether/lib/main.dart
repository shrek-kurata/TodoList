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
            children: <Widget>[_banner(), _eventLists(), _eventLists()]));
  }

  Widget _banner() => Container(
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

  Widget _eventLists() => Container(
        height: 200,
        color: Colors.green,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[_listItem(), _listItem(), _listItem(), _listItem(), _listItem()],
        ),
      );

  Widget _listItem() => Container(
        height: 150,
        width: 170,
        child: Column(
          children: <Widget>[
            Image.asset('images/倉田.jpg', width: 170, height: 100,),
            Column(
              children: <Widget>[Text('10/20 9:00-12:00'), Text('東京都芝公園2-12')],
            )
          ],
        ),
      );
}
