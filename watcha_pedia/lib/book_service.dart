import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'book.dart';
import 'main.dart';

class BookService extends ChangeNotifier {
  // 처음 앱 시작할떄 : 생성자(클래스 이름과 같은 함수) 함수에 넣기
  BookService() {
    loadLikedBookList();
  }
  List<Book> bookList = []; // 책 목록
  List<Book> likedBookList = []; // 좋아요 목록

  void toggleLikeBook({required Book book}) {
    String bookId = book.id;
    if (likedBookList.map((book) => book.id).contains(bookId)) {
      likedBookList.removeWhere((book) => book.id == bookId);
    } else {
      likedBookList.add(book);
    }
    notifyListeners();
    saveLikedBookList();
  }

  void search(String q) async {
    bookList.clear(); // 검색 버튼 누를때 이전 데이터들을 지워주기

    if (q.isNotEmpty) {
      Response res = await Dio().get(
        "https://www.googleapis.com/books/v1/volumes?q=$q&startIndex=0&maxResults=40",
      );
      List items = res.data["items"];

      for (Map<String, dynamic> item in items) {
        Book book = Book(
          id: item['id'],
          title: item['volumeInfo']['title'] ?? "",
          subtitle: item['volumeInfo']['subtitle'] ?? "",
          thumbnail: item['volumeInfo']['imageLinks']?['thumbnail'] ??
              "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg",
          previewLink: item['volumeInfo']['previewLink'] ?? "",
          authors: item['volumeInfo']['authors'] ?? [],
          publishedDate: item['volumeInfo']['publishedDate'] ?? "",
        );
        bookList.add(book);
      }
      //print(bookList);
      notifyListeners();
    }
  }

  saveLikedBookList() {
    List likedBookJsonList =
        likedBookList.map((book) => book.toJson()).toList();

    // JSON 인코드
    String jsonString = jsonEncode(likedBookJsonList);

    prefs.setString('likedBookList', jsonString);
  }

  loadLikedBookList() {
    String? jsonString = prefs.getString('likedBookList');

    if (jsonString == null) return;
    // JSON 디코드
    List likedBookJsonList = jsonDecode(jsonString);

    likedBookList =
        likedBookJsonList.map((json) => Book.fromJson(json)).toList();
  }
}
