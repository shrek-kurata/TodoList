import 'package:flutter/material.dart';
import 'package:infinite_list/bloc/bloc.dart';
import 'package:infinite_list/bloc/post_bloc.dart';
import 'package:http/http.dart' as http;

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter infinite scroll',
      home: Scaffold(appBar: AppBar(title: Text('Posts')), body: HomePage()),
    );
  }
}

/// ここらへんはよくあるUIの作成のやり方
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  //　なんで、わざわざPresetationでhttp.ClientをIntance化するんだあ、、、？
  final PostBloc _postBloc = PostBloc(httpClient: http.Client());
  final _scrollThread = 200.0;

  _HomePageState() {
    _scrollController.addListener();
    //Fetchクラスを引数に入れて、ここでは、Fetchすることを明らかにする
    _postBloc.dispatch(Fetch());
  }

  /// 無限スクロールをするためのロジック
  /// maxScrollとcurrentScrollの差分がscrollThreshHoldより小さくなったら、fetchする
  void onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if(maxScroll - currentScroll <= _scrollThreshHold) {
      _postBloc.dispatch(Fetch());
    }
  }
}
