import 'dart:async';
import 'package:flutter/material.dart';
import 'package:word_search/wordsearch_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => WordsearchPage())));
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Padding(
                padding: EdgeInsets.only(top: 300.0),
                child: Text(
                  'Welcome to search word',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 300,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            ),
          ]),
        )));
  }
}
