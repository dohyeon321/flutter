import 'package:flutter/material.dart';

class ColoredCircles extends StatefulWidget {
  @override
  _ColoredCirclesState createState() => _ColoredCirclesState();
}

class _ColoredCirclesState extends State<ColoredCircles> {
  bool _isMoving = false; // Start with true to initiate animation

  @override
  void initState() {
    super.initState();

    // Start animation after a delay (if needed)
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isMoving = !_isMoving; // Toggle the animation state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            top: _isMoving ? MediaQuery.of(context).size.height / 2 - 170 : 200,
            left: _isMoving ? MediaQuery.of(context).size.width / 2 - 50 : -23,
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(5, 129, 183, 0.75),
              radius: 50,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            top: _isMoving ? MediaQuery.of(context).size.height / 2 - 110 : -15,
            left: _isMoving ? MediaQuery.of(context).size.width / 2 - 50 : 280,
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(255, 220, 98, 0.75),
              radius: 50,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            top: _isMoving ? MediaQuery.of(context).size.height / 2 + 70 : 780,
            left: _isMoving ? MediaQuery.of(context).size.width / 2 - 50 : 130,
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(0, 142, 31, 0.75),
              radius: 50,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            top: _isMoving ? MediaQuery.of(context).size.height / 2 + 10 : 350,
            left: _isMoving ? MediaQuery.of(context).size.width / 2 - 50 : 330,
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(208, 35, 77, 0.75),
              radius: 50,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            top: _isMoving ? MediaQuery.of(context).size.height / 2 - 50 : 500,
            left: _isMoving ? MediaQuery.of(context).size.width / 2 - 50 : -23,
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(255, 122, 48, 0.75),
              radius: 50,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ColoredCircles(),
  ));
}
