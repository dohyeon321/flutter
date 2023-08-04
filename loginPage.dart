import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme : ThemeData(
        // fontFamily: "NotoSansKR",
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, //appBar 하얀색
          elevation: 0,
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,),// 뒤로 가기 아이콘
          onPressed: (){
            // 뒤로 가기 기능 여기 넣으면 댐
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center, // 이미지와 텍스트를 중앙에 배치
        children: [
          Positioned(
            top: 50, // 텍스트의 y 위치 설정
            left: MediaQuery.of(context).size.width / 2 - 140, // 이미지의 x 위치 설정
            child: Text(
              'PROJECT TOGETHER', // 텍스트 내용
              style: TextStyle(
                fontFamily: "NotoSansKR",
                fontSize: 30,
                fontWeight: FontWeight.w100,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 120, // 이미지의 y 위치 설정
            left: MediaQuery.of(context).size.width / 2 - 125, // 이미지의 x 위치 설정
            child: Image.asset(
              'assets/5circle.png',
              width: 250,
              height: 250,
            ),
          ),
          Positioned(
            top: 400,
            left: MediaQuery.of(context).size.width / 2 - 200,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '     이메일, 전화번호',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), // 테두리 둥글기 설정
                  ),
                ),
                style: TextStyle(
                  fontFamily: "NotoSansKR",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              width: 400, // 입력칸 너비 설정
            ),
          ),
          Positioned(
            top: 480,
            left: MediaQuery.of(context).size.width / 2 - 200,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '     비밀번호',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), // 테두리 둥글기 설정
                  ),
                ),
                style: TextStyle(
                  fontFamily: "NotoSansKR",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              width: 400, // 입력칸 너비 설정
            ),
          ),
          Positioned(
            top: 550, // 링크 텍스트의 y 위치 설정
            left: MediaQuery.of(context).size.width / 2 - 160, // 링크 텍스트의 x 위치 설정
            child: GestureDetector(
              onTap: () {
                // 클릭 이벤트 처리
              },
              child: Text(
                '비밀번호를 잊으셨나요?', // 클릭 가능한 텍스트 내용
                style: TextStyle(
                  fontFamily: "NotoSansKR",
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  decoration: TextDecoration.underline, // 밑줄 추가
                ),
              ),
            ),
          ),
          Positioned(
            top: 580, // 로그인 버튼의 y 위치 설정
            left: MediaQuery.of(context).size.width / 2 - 170, // 로그인 버튼의 x 위치 설정
            child: ElevatedButton(
              onPressed: () {
                // 로그인 버튼 클릭 이벤트 처리
              },
              child: Text(
                '로그인',
                style: TextStyle(
                  fontFamily: "NotoSansKR",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15), // 버튼 패딩 설정
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40), // 버튼 테두리 둥글기 설정
                ),
                primary: Color.fromRGBO(70, 70, 70, 1), // 버튼 배경색 설정
              ),
            ),
          ),
        ],
      ),
    );
  }
}