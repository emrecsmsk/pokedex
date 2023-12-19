import 'package:flutter/material.dart';

class CustomTheme {
  late ThemeData initialTheme;
  late ThemeData grassTheme;
  late ThemeData fireTheme;
  late ThemeData waterTheme;
  late ThemeData bugTheme;

  CustomTheme() {
    initialTheme = ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.black),
        ),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(style: BorderStyle.solid, color: Colors.black)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(style: BorderStyle.solid, color: Colors.black),
            )));

    grassTheme = ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.green),
        ),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(style: BorderStyle.solid, color: Colors.green)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(style: BorderStyle.solid, color: Colors.green),
            )));

    fireTheme = ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.red),
        ),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(style: BorderStyle.solid, color: Colors.red)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(style: BorderStyle.solid, color: Colors.red),
            )));

    waterTheme = ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.blue),
        ),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(style: BorderStyle.solid, color: Colors.blue)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(style: BorderStyle.solid, color: Colors.blue),
            )));

    bugTheme = ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.purple),
        ),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(style: BorderStyle.solid, color: Colors.purple)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(style: BorderStyle.solid, color: Colors.purple),
            )));
  }
}
