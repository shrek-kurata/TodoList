import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:infinite_list/bloc/bloc.dart';
import 'package:infinite_list/bloc/post_event.dart';
import 'package:infinite_list/bloc/post_state.dart';
import 'package:infinite_list/post.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;

  /// instance化する際、PostBlocにClientを渡すのを必須化する
  PostBloc({@required this.httpClient});

  /// 初期値を規定する
  @override
  PostState get initialState => PostUninitianlized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    /// [currentState] => _behaviorSubject.value
    /// eventがfetchの場合でやらないと大変なことになる
    /// stateがhasReachedしてるか
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        /// インスタンス化されてない→post stateがない→ 表示されていない
        /// 最初から_fetchPostsする
        if (currentState is PostUninitianlized) {
          final posts = await _fetchPosts(0, 20);
          yield PostLoaded(posts: posts, hasReachedMax: false);
        }
        if (currentState is PostLoaded) {
          /// currentStateは、PostStateなので、PostLoadedだった場合の状態を出さねばならない。
          /// [疑問] いわゆる、PostStateの役割というのは、packageの管理と、ジェネリクスパラメータとしての役割ということでいいのかなぁ
          final PostLoaded state = currentState;
          final posts = await _fetchPosts(state.posts.length, 20);

          /// postsがからだったら、今のままを返せばいい。ただし、もう存在しないということなので
          /// 再度loadingしないように、hasReachedMax propertyをtrueにしてかえす。
          /// postsがあった場合、現在のcurrentStateと,取得したpostを返す。
          /// まだ、全部取得していない可能性があるので、false
          yield posts.isEmpty
              ? state.copyWith(hasReachedMax: true)
              : PostLoaded(posts: state.posts + posts, hasReachedMax: false);
        }
      } catch (_) {
        yield PostError();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostLoaded && state.hasReachedMax;
      
  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    final response = await httpClient.get(
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    if (response.statusCode == 200) {
      /// decode === 符号化されたデータを元に戻すこと
      /// jsonが符号化されてるのかなるほど
      final data = json.decode(response.body) as List;

      /// map構文で返してるのはMappedIterableなので、toList()して、List型にしないとだめよ！
      /// Post型に直して、Modelにうめこむ。
      return data.map((rawPost) {
        return Post(
            id: rawPost['id'], title: rawPost['title'], body: rawPost['body']);
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}
