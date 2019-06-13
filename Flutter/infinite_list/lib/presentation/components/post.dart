import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_list/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  /// 初期化の引数の時に、postを必須にする
  const PostWidget({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${post.id}', style: TextStyle(fontSize: 15.0)),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.body),
      dense: true,
    );
  }
}