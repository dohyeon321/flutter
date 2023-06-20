import 'package:flutter/material.dart';
import 'package:untitled3/그룹생성.dart';

import '회원가입.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '로그인 페이지',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 400,
            ),
            const SizedBox(height: 32.0),
            const SizedBox(height: 32.0),
            TextField(
              decoration: InputDecoration(
                labelText: '사용자 이름',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: '비밀번호',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // 로그인 버튼이 클릭되었을 때 처리하는 로직을 추가하세요.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const makeGroup()),
                    );
                  },
                  child: const Text('로그인'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const mem()),
                    );
                  },
                  child: const Text(
                    '가입하기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // 검은색으로 설정
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
