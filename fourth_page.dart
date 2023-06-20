import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/rightArrow.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1647),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/home.png',
                width: 33,
                height: 33,
              ),
              SizedBox(width: 8),
              Text(
                '그루비룸',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // 메뉴 버튼을 눌렀을 때 수행할 작업
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // 첫 번째 이미지와 텍스트
                Transform.translate(
                  offset: Offset(10, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          imagePaths[0],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Me',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),

                // 두 번째 이미지와 텍스트
                Transform.translate(
                  offset: Offset(10, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          imagePaths[1],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '하임',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),

                // 세 번째 이미지와 텍스트
                Transform.translate(
                  offset: Offset(10, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          imagePaths[2],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '주하',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),

                // 네 번째 이미지와 텍스트
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FourthPage()),
                    );
                  },
                  child: Transform.translate(
                    offset: Offset(10, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            imagePaths[3],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '도현',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),

                // 추가된 이미지
                Transform.translate(
                  offset: Offset(80, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          imagePaths[4],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 55),

// 새로운 행
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30), // 왼쪽 패딩을 추가하기 위해 right를 사용합니다.
                  child: Container(
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13),
                        topRight: Radius.circular(13),
                        bottomLeft: Radius.circular(13),
                        bottomRight: Radius.circular(13),
                      ),
                      color: Color.fromRGBO(99, 99, 99, 100),
                    ),
                    child:Center(
                      child: RichText(
                        text: TextSpan(
                          text: '도현',
                          style: TextStyle(
                            color: Color.fromRGBO(28, 21, 71, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            TextSpan(
                              text: '의 투두리스트',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ), // 첫 번째 Container와 두 번째 Container 사이의 간격을 조절할 수 있습니다.
                Container(
                  width: 80, // 두 번째 Container의 너비를 원하는 값으로 설정해주세요.
                  height: 30, // 두 번째 Container의 높이를 원하는 값으로 설정해주세요.
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: Color.fromRGBO(28, 21, 71, 1),
                  ),
                  child: Center(
                    child: Text(
                      '개발',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // 4개의 체크 박스
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0), // 테두리를 둥글게 조절하는 값
                    ),
                  ),
                  title: Text(
                    '로그인 페이지 구현',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Checkbox(
                    value: false,
                    onChanged: (value) {},
                    activeColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  title: Row(
                    children: [
                      Text(
                        '회원가입 페이지 구현',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 50), // 추가된 박스와 텍스트 사이의 간격을 조절할 수 있습니다.
                      Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 199, 0, 100),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text(
                            'Hurry Up!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ListTile(
                  leading: Checkbox(
                    value: false,
                    onChanged: (value) {},
                    activeColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0), // 테두리를 둥글게 조절하는 값
                    ),
                  ),
                  title: Row(
                    children: [
                      Text(
                        '보고서 쓰기',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 120), // 추가된 박스와 텍스트 사이의 간격을 조절할 수 있습니다.
                      Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 199, 0, 100),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text(
                            'Hurry Up!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0), // 테두리를 둥글게 조절하는 값
                    ),
                  ),
                  title: Text(
                    '발표 PPT 만들기',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // 아이콘을 누를 때의 동작을 정의합니다. 텍스트 입력 기능을 추가하면 됩니다.
                    // 예를 들어, 다이얼로그를 표시하여 텍스트 입력을 받을 수 있습니다.
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('텍스트 입력'),
                          content: TextField(
                            // 텍스트 입력 필드 설정
                            // 원하는 스타일이나 동작을 추가하여 사용할 수 있습니다.
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // 텍스트 입력을 완료하고 다이얼로그를 닫는 동작을 추가합니다.
                                Navigator.of(context).pop();
                              },
                              child: Text('확인'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 25, top: 10),
                    child: Icon(
                      Icons.add_circle,
                      color: Color.fromRGBO(99, 99, 99, 100),
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF1D1647),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // 첫 번째 부분을 터치했을 때 수행할 작업
                },
                child: Container(
                  color: Color(0xFFEAEAEA),
                  height: 56,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/Image28.png',
                      width: 30, // 이미지의 너비 설정
                      height: 30, // 이미지의 높이 설정
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // 두 번째 부분을 터치했을 때 수행할 작업
                },
                child: Container(
                  height: 56,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/Image15.png',
                      width: 30, // 이미지의 너비 설정
                      height: 30, // 이미지의 높이 설정
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // 세 번째 부분을 터치했을 때 수행할 작업
                },
                child: Container(
                  height: 56,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/Image14.png',
                      width: 30, // 이미지의 너비 설정
                      height: 30, // 이미지의 높이 설정
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
