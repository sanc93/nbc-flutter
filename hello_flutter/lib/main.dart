import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Flutter", style: TextStyle(fontSize: 28))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 이미지 추가
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Image.network(
                    "https://i.ibb.co/nngK6j3/startup.png",
                    width: 150,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "이메일 주소"),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "비밀번호"),
                ),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 25),
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("로그인"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
