import 'package:flutter/material.dart';
import 'package:flutter_login/pages/group_main_page.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  String _selectedGender = "남자";
  String _selectedBirthDate = "2000년 1월 1일";
  bool _isMaleSelected=false;
  bool _isFemaleSelected=false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _verificationCodeController = TextEditingController();
  DateTime _selectedDate=DateTime.now();

  void _selectDate(BuildContext context) async{
    final DateTime? pickedDate= await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now()
    );
    if(pickedDate!=null&&pickedDate!=_selectedDate){
      setState(() {
        _selectedDate=pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('회원가입',
          style:TextStyle(color:Colors.black),
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
        child: ListView(
          children: [
            Image.asset('assets/image/img_1.png', height: 100, width: 200),
            buildTextFieldWithLabel('아이디', '이메일 또는 휴대폰 번호' ,_emailController),
            SizedBox(height: 16.0),
            buildTextFieldWithLabel('비밀번호','영문,숫자 조합,8자 이상',_passwordController,isPassword: true),
            SizedBox(height: 16.0),
            buildTextFieldWithLabel('비밀번호 확인','비밀번호를 한번 더 입력해주세요',_confirmPasswordController,isPassword: true),
            SizedBox(height: 16.0),
            buildTextFieldWithLabel('이름',' ',_nameController),
            SizedBox(height: 16.0),
            Row(
              children:[
                Text('생년월일                     '),
                GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text(
                        '${_selectedDate.year}년 ${_selectedDate.month}월 ${_selectedDate.day}일'
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.0),
            Row(
              children: [
                Text('성별'),
                SizedBox(width: 16.0),
                Checkbox(
                  value: _isMaleSelected,
                  onChanged: (value) {
                    setState(() {
                      _isMaleSelected = value ?? false;
                      if (_isMaleSelected) {
                        _isFemaleSelected = false;
                      }
                    });
                  },
                ),
                Text('남성'),
                SizedBox(width: 16.0),
                Checkbox(
                  value: _isFemaleSelected,
                  onChanged: (value) {
                    setState(() {
                      _isFemaleSelected = value ?? false;
                      if (_isFemaleSelected) {
                        _isMaleSelected = false;
                      }
                    });
                  },
                ),
                Text('여성'),
              ],
            ),
            buildTextFieldWithLabel('이름',' ',_nameController),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                String emailOrPhone = _emailController.text;
                String password = _passwordController.text;
                String confirmPassword = _confirmPasswordController.text;
                String name = _nameController.text;
                String gender = _selectedGender;
                String birthDate = _selectedBirthDate;
                String phone = _phoneController.text;
                String verificationCode = _verificationCodeController.text;

                // 여기에 회원가입 처리 로직을 추가하세요.
                // 예를 들면 입력 데이터의 유효성 검사, 서버와의 통신 등이 있을 수 있습니다.
                // 현재는 간단하게 입력 데이터를 출력하는 예시만 포함하였습니다.

                print('이메일 또는 휴대폰 번호: $emailOrPhone');
                print('비밀번호: $password');
                print('비밀번호 확인: $confirmPassword');
                print('이름: $name');
                print('성별: $gender');
                print('생년월일: $birthDate');
                print('휴대폰 번호: $phone');
                print('인증번호: $verificationCode');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>GroupMainPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20),
                ),
              ),
              child: Text('가입하기'),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildTextFieldWithLabel(
      String label, String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(label),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.black),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}