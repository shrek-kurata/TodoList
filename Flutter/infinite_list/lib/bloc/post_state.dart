import 'package:equatable/equatable.dart';
import 'package:infinite_list/post.dart';

//Postがどういう状態なのかを司どる。

// abstarctクラスは、パッケージをimportする基底クラス
abstract class PostState extends Equatable {
  PostState([List props = const []]) : super(props);
}

// postがなかった時に、返す
class PostUninitianlized extends PostState {
  @override
  String toString() => 'PostUninitianlized';
}

// post loadに対して、errorが当たっ時に返す
class PostError extends PostState {
  @override
  String toString() => 'PostError';
}

// post loaded状態だった時に、余ってるかの確認するクラス
class PostLoaded extends PostState {
  final List<Post> posts;
  final bool hasReachedMax;

  PostLoaded({
    this.posts,
    this.hasReachedMax,
  }) : super([posts, hasReachedMax]);

  PostLoaded copyWith({
    List<Post> posts,
    bool hasReachedMax,
  }) {
    return PostLoaded(
        posts: posts ?? this.posts,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  String toString() => 'PostLoaded { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
}

