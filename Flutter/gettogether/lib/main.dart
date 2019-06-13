import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gettogether/application/blocs/user_bloc.dart';
import 'package:gettogether/presentation/event_form/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gettogether',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Gettogether'));
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
      body: Column(children: <Widget>[
        _banner(),
        Container(height: 30),
        _eventLists('募集中のスポーツ'),
        _eventLists('今すぐスポーツ')
      ]),
    );
  }

  Widget _banner() => Container(
      height: 285,
      decoration: BoxDecoration(color: Colors.red),
      // widthをフル画面サイズにしたいんだが、paddingで設定しているので、android対応とか多分できていない
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 69.0),
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: <Widget>[
          RaisedButton(
              onPressed: () {
                _handleGoogleSignIn();
              },
              padding: EdgeInsets.symmetric(horizontal: 33.0),
              color: Color.fromRGBO(157, 232, 104, 1),
              textColor: Colors.white,
              child: Text('スポーツする仲間を見つけよう',
                  style: TextStyle(
                      fontSize: 15, fontFamily: 'Hiragino Kaku Gothic ProN')),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)))),
        ],
      ));

  void _handleGoogleSignIn() {
    UserBloc().signUp().then((_) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EventFormPage()));
    });
  }

  Widget _eventLists(String title) => Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
              alignment: Alignment.topLeft,
              child: Text(title,
                  style: TextStyle(
                      fontFamily: 'Hiragino Kaku Gothic ProN',
                      fontSize: 15,
                      fontWeight: FontWeight.w800))),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _listItem(),
                _listItem(),
                _listItem(),
                _listItem(),
                _listItem()
              ],
            ),
          ),
        ],
      ));

  Widget _listItem() => Container(
        height: 150,
        width: 170,
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/倉田.jpg',
              width: 170,
              height: 80,
              fit: BoxFit.fitWidth,
            ),
            Container(
              height: 70,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text('10/20 9:00-12:00',
                      style: TextStyle(fontFamily: 'Avenir', fontSize: 15)),
                  Text('東京都芝公園2-12',
                      style: TextStyle(
                          fontFamily: 'Hiragino Kaku Gothic ProN',
                          fontSize: 10))
                ],
              ),
            ),
          ],
        ),
      );
}
