import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData( //dart mode
    scaffoldBackgroundColor: Colors.grey.shade900,  //메인화면 배경색
    colorScheme: const ColorScheme.dark(),  //전체테마
    primaryColor: Colors.black, //탭바글자색
    bottomAppBarColor: Colors.black,  //하단바색
    primaryColorLight: Colors.white70,  //탭바 글자,아이콘 색
    highlightColor: Colors.red, // 하이라이트색
    indicatorColor: Colors.yellow[400], // 다크모드색
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color:Colors.white),
        backgroundColor: Colors.black, foregroundColor: Colors.white),  //상단바색


  );

  static final lightTheme = ThemeData(  //light mode
    scaffoldBackgroundColor: Colors.white,  //메인화면 배경색
    colorScheme: const ColorScheme.light(), //전체테마
    primaryColor: Colors.white, //탭바글자색
    bottomAppBarColor: Colors.white,  //하단바색
    primaryColorLight: Colors.black,  //탭바 글자,아이콘색
    highlightColor: Colors.red, // 하이라이트색
    indicatorColor: Colors.black, // 다크모드색
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color:Colors.black),
        backgroundColor: Colors.white, foregroundColor: Colors.black),  //상단바색

  );
}
