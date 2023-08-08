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
      body: Stack(
        alignment: Alignment.center, // 이미지와 텍스트를 중앙에 배치
        children: [
          Positioned(
            top: 150, // 첫 번째 원의 y 위치 설정
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(5, 129, 183, 0.75), // 원의 배경색
              ),
            ),
          ),
          Positioned(
            top: 230, // 두 번째 원의 y 위치 설정
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:  Color.fromRGBO(255, 220, 98, 0.75), // 원의 배경색
              ),
            ),
          ),
          Positioned(
            top: 470, // 세 번째 원의 y 위치 설정
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(0, 142, 31, 0.75), // 원의 배경색
              ),
            ),
          ),
          Positioned(
            top: 390, // 네 번째 원의 y 위치 설정
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(208, 35, 77, 0.75), // 원의 배경색
              ),
            ),
          ),
          Positioned(
            top: 310, // 다섯 번째 원의 y 위치 설정
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(255, 122, 48, 0.75), // 원의 배경색
              ),
            ),
          ),
          Positioned(
            top: 675,
            left: MediaQuery.of(context).size.width / 2 - 170, // 로그인 버튼의 x 위치 설정
            child: ElevatedButton(
              onPressed: () {
                //  버튼 클릭 이벤트 처리
              },
              child: Text(
                '새 계정 만들기',
                style: TextStyle(
                  fontFamily: "NotoSansKR",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15), // 버튼 패딩 설정
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // 버튼 테두리 둥글기 설정
                  side: BorderSide(color: Color.fromRGBO(209, 209, 209, 1), width: 1), // 검은색 테두리 추가
                ),
                primary: Color.fromRGBO(255, 255, 255, 1), // 버튼 배경색 설정
                elevation: 0, //그림자 제거
              ),
            ),
          ),
          Positioned(
            top: 750, //
            left: MediaQuery.of(context).size.width / 2 - 170, // 로그인 버튼의 x 위치 설정
            child: ElevatedButton(
              onPressed: () {
                //  버튼 클릭 이벤트 처리
              },
              child: Text(
                '이미 계정이 있나요? 로그인',
                style: TextStyle(
                  fontFamily: "NotoSansKR",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 72, vertical: 15), // 버튼 패딩 설정
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // 버튼 테두리 둥글기 설정
                  side: BorderSide(color: Color.fromRGBO(209, 209, 209, 1), width: 1), // 검은색 테두리 추가
                ),
                primary: Color.fromRGBO(209, 209, 209, 1), // 버튼 배경색 설정
                elevation: 0, //그림자 제거
              ),
            ),
          ),
        ],
      ),
    );
  }
}