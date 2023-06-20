import 'package:flutter/material.dart';
import '그룹생성.dart';

class mem extends StatelessWidget {
  const mem({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입하기'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // 뒤로가기 버튼이 클릭되었을 때 처리하는 로직을 추가하세요.
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: '이메일',
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
            ElevatedButton(
              onPressed: () {
                // 확인하기 버튼이 클릭되었을 때 처리하는 로직을 추가하세요.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const makeGroup()),
                );
              },
              child: const Text('확인하기'),
            ),
          ],
        ),
      ),
    );
  }
}
