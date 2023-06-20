import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class basic {
  Widget build(BuildContext context) {
    return Scaffold(appBar: appbar(),);
  }

  appbar() {
    AppBar(
      centerTitle: true,
      backgroundColor: Color(0xff1d1647),
      title: Text('그루비룸', style: TextStyle(color: Colors.white)),
    );
  }
}
