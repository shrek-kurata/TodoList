import 'package:flutter/widgets.dart';
import 'package:gettogether/presentation/share_dialog/provider_service.dart'
    as ShareProvider;

class Button extends StatefulWidget {
  Button({Key key, this.providerType}) : super(key: key);
  final ShareProvider.Type providerType;
  @override
  State<StatefulWidget> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) => Container(
      width: 250,
      height: 50,
      decoration: _boxDecoration,
      alignment: Alignment.center,
      child: _buttonContent());

  Widget _buttonContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ShareProvider.convertToImage(widget.providerType),
          Container(width: 10),
          Text(ShareProvider.convertToString(widget.providerType) + 'でシェア！',
              style: _buttonTextStyle, textAlign: TextAlign.center)
        ],
      );

  static var _buttonTextStyle =
      TextStyle(fontFamily: 'Avenir', fontSize: 15, color: _buttonTextColor);
  static var _buttonTextColor = Color.fromRGBO(92, 111, 112, 1);

  static var _boxDecoration =
      BoxDecoration(border: _border, borderRadius: BorderRadius.circular(6.0));

  static var _border =
      Border.all(color: _borderColor, width: 2, style: BorderStyle.solid);

  static var _borderColor = Color.fromRGBO(230, 234, 234, 1);
}
