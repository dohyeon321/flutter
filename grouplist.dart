import 'package:flutter/material.dart';
import 'package:untitled3/%EB%B0%A9%EC%83%9D%EC%84%B1%EC%B4%88%EB%8C%80%EC%BD%94%EB%93%9C%EC%9E%85%EB%A0%A5.dart';

import 'CustomDrawerMenu.dart';

class grouplist extends StatefulWidget {
  const grouplist({Key? key}) : super(key: key);

  @override
  _grouplistState createState() => _grouplistState();
}

class _grouplistState extends State<grouplist>
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
    final screenWidth = MediaQuery.of(context).size.width;
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
          Positioned(
            top: 20,
            left: 20,
            width: screenWidth - 40, // Adjust the padding as needed
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GroupScreen()),//그루비룸 메인으로 연결해주기
                );
              },
              child: Text(
                '그루비룸',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GroupScreen()),
                    );
                  },
                ),
                Text('그룹 만들기'),
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