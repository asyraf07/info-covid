import 'package:flutter/material.dart';

class TextWhiteNum extends StatelessWidget {
  final String _text;
  TextWhiteNum(this._text);
  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Nexa',
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
    );
  }
}

class TextWhiteNumSmall extends StatelessWidget {
  final String _text;
  TextWhiteNumSmall(this._text);
  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Nexa',
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }
}

class TextWhiteDesc extends StatelessWidget {
  final String _text;
  TextWhiteDesc(this._text);
  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Nexa',
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}

class TextWhiteBold extends StatelessWidget {
  final String _text;
  TextWhiteBold(this._text);
  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Nexa',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}

class TextWhiteBoldBig extends StatelessWidget {
  final String _text;
  TextWhiteBoldBig(this._text);
  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Nexa',
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }
}
