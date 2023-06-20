import 'package:flutter/material.dart';

class InvitationScreen extends StatefulWidget {
  const InvitationScreen({Key? key}) : super(key: key);

  @override
  _InvitationScreenState createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> {
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  bool _isCodeConfirmed = false;
  bool _isInvalidCode = false;

  @override
  void dispose() {
    _focusNodes.forEach((node) => node.dispose());
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _checkCode() {
    final code = _controllers.map((controller) => controller.text).join();
    if (code.length == 4) {
      if (code == '1234') {
        setState(() {
          _isCodeConfirmed = true;
          _isInvalidCode = false;
        });
      } else {
        setState(() {
          _isCodeConfirmed = false;
          _isInvalidCode = true;
        });
      }
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
            // 뒤로가기 버튼을 눌렀을 때의 동작을 추가하세요
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // 메뉴 버튼을 눌렀을 때의 동작을 추가하세요
              // TODO: 메뉴 버튼을 눌렀을 때의 동작 구현
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '초대 코드를 입력하세요!',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    color: Colors.grey[300],
                    child: Center(
                      child: TextField(
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        focusNode: _focusNodes[index],
                        controller: _controllers[index],
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            _focusNodes[index].unfocus();
                            _focusNodes[index + 1].requestFocus();
                          }
                          _checkCode();
                        },
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 16.0),
            if (_isCodeConfirmed)
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '* 초대 코드가 확인되었습니다',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            if (_isInvalidCode)
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '* 존재하지 않는 코드입니다',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 40.0),
            TextField(
              decoration: InputDecoration(
                hintText: '이름을 입력하세요!',
              ),
            ),
            SizedBox(height: 80.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // 입장 버튼 눌렀을 때 동작 구현
                },
                child: Text('입장'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

