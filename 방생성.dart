import 'package:flutter/material.dart';
import 'package:untitled3/%EB%B0%A9%EC%83%9D%EC%84%B1%EC%B4%88%EB%8C%80%EC%BD%94%EB%93%9C%EC%9E%85%EB%A0%A5.dart';

import 'CustomDrawerMenu.dart';

class make extends StatefulWidget {
  const make({Key? key}) : super(key: key);

  @override
  _makeState createState() => _makeState();
}

class _makeState extends State<make>
    with SingleTickerProviderStateMixin {
  bool _isMenuOpen = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: -300, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
    if (_isMenuOpen) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('그룹 생성'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _toggleMenu();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: '그룹 이름을 입력하세요',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: '닉네임을 입력하세요',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 확인 버튼에 대한 동작을 여기에 추가하세요
                  },
                  child: Text('확인'),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            transform: Matrix4.translationValues(_animation.value, 0, 0),
            child: CustomDrawerMenu(
              isMenuOpen: _isMenuOpen,
              toggleMenu: _toggleMenu,
            ),
          ),
        ],
      ),
    );
  }
}