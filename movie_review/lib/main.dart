import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 음식 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "탑건: 매버릭",
        "imgUrl": "https://i.ibb.co/sR32PN3/topgun.jpg",
      },
      {
        "category": "마녀2",
        "imgUrl": "https://i.ibb.co/CKMrv91/The-Witch.jpg",
      },
      {
        "category": "범죄도시2",
        "imgUrl": "https://i.ibb.co/2czdVdm/The-Outlaws.jpg",
      },
      {
        "category": "헤어질 결심",
        "imgUrl": "https://i.ibb.co/gM394CV/Decision-to-Leave.jpg",
      },
      {
        "category": "브로커",
        "imgUrl": "https://i.ibb.co/MSy1XNB/broker.jpg",
      },
      {
        "category": "문폴",
        "imgUrl": "https://i.ibb.co/4JYHHtc/Moonfall.jpg",
      },
    ];

    // 화면에 보이는 영역
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 7,
          title: Text(
            'Movie Reviews',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.account_box,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: "영화 제목을 검색해주세요",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20))),
            ),
            Divider(
              height: 20,
              color: Colors.transparent,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      String category = dataList[index]['category'];
                      String imgUrl = dataList[index]['imgUrl'];

                      return Card(
                        color: Colors.white10,
                        elevation: 90.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: 360,
                                height: 220,
                                child: ClipRRect(
                                  child: Image.network(
                                    imgUrl,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              category,
                            ),
                          ],
                        ),
                      );
                    }))
          ],
        ));
  }
}
