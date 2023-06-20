import 'package:flutter/material.dart';

class CustomDrawerMenu extends StatelessWidget {
  final bool isMenuOpen;
  final Function toggleMenu;

  const CustomDrawerMenu({
    required this.isMenuOpen,
    required this.toggleMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile_image.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'example@mail.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              toggleMenu(); // 메뉴 닫기
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              toggleMenu(); // 메뉴 닫기
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('로그아웃'),
            onTap: () {
              toggleMenu(); // 메뉴 닫기
              // 로그아웃 처리를 수행하는 코드 작성
            },
          ),
        ],
      ),
    );
  }
}