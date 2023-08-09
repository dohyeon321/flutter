import 'package:flutter/material.dart';
import 'package:flutter_login/pages/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
            '로그인',
        style: TextStyle(color:Colors.black),
        ),

        iconTheme: IconThemeData(color:Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            //뒤로가기 버튼을 눌렀을 때 처리할 내용
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/image/img.png',width: 50,height: 300),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color:Colors.black,width:1.0),
              ),
            child:TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: '이메일,전화번호',
                border: InputBorder.none,

                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ), // 사각형 내부의 텍스트 여백 설정
              ),
              ),
            ),
            SizedBox(height: 16.0),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color:Colors.black,width:1.0),
        ),
        child:TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                )
              ),
            ),
            SizedBox(height: 8.0),
            TextButton(
                onPressed:(){
              //
            },
                child: Text(
                  '비밀번호를 잊으셨나요?',
                  style: TextStyle(color:Colors.black),
                ),
            ),

            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                String password = _passwordController.text;
                _login(email, password);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>SignPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('로그인',
              style:TextStyle(
                  color: Colors.white,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login(String email, String password) {
    // 여기에 실제 로그인 처리 로직을 구현
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('로그인 성공'),
        content: Text('이메일: $email\n비밀번호: $password'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('확인'),
          ),
        ],
      ),
    );
  }
}
