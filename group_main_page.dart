import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Tester님의 워크스페이스',style: TextStyle(color:Colors.black),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // 그룹 추가 버튼을 눌렀을 때 처리하는 로직을 추가하세요.
                      print('그룹 추가 버튼을 눌렀습니다.');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Icon(Icons.add,color: Colors.black),

                  ),
                ),

              ],
            ),


            // 이후에 더 많은 그룹 버튼과 프로필을 추가할 수 있습니다.
          ],
        ),
      ),
    );
  }
}