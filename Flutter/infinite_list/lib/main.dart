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
  final _scrollThreashHold = 200.0;

  _HomePageState() {
    /// scrollControllerをinstance化して、scroll状態を常に監視しておく
    _scrollController.addListener(_onScroll);

    /// Fetchクラスを引数に入れて、ここでは、Fetchすることを明らかにする
    /// 初期化したときに、一旦fetchする。
    _postBloc.dispatch(Fetch());
  }

  /// 無限スクロールをするためのロジック
  /// maxScrollとcurrentScrollの差分がscrollThreshHoldより小さくなったら、fetchする
  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreashHold) {
      _postBloc.dispatch(Fetch());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _postBloc,
        builder: (BuildContext context, PostState state) {
          if (state is PostUninitianlized) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PostError) {
            return Center(child: Text('Failed Fetch posts'));
          }
          if (state is PostLoaded) {
            if (state.posts.isEmpty) {
              return Center(child: Text('no posts'));
            }

            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.posts.length
                    ? BottomLoader()
                    : PostWidget(post: state.posts[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.posts.length
                  : state.posts.length + 1,
              controller: _scrollController,
            );
          }
        });
  }

  @override
  void dispose() {
    _postBloc.dispose();
    super.dispose();
  }
}
