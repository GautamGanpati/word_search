import 'package:flutter/material.dart';
import 'package:word_search/gridformation_page.dart';

class WordsearchPage extends StatefulWidget {
  const WordsearchPage({super.key});

  @override
  State<WordsearchPage> createState() => _WordsearchPageState();
}

class _WordsearchPageState extends State<WordsearchPage> {
  void navigatetogridformationpage() {
    if (rowstext.text == "" && columntext.text == "") {
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => GridformationPage(
            columntext: int.parse(columntext.text),
            rowtext: int.parse(rowstext.text),
          ),
        ),
      );
    }
  }

  final TextEditingController rowstext = TextEditingController();
  final TextEditingController columntext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 5,
          centerTitle: false,
          title: Text('Word Search'),
        ),
        body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Enter no. of Rows',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 80.0, right: 80.0),
              child: Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: TextField(
                  controller: rowstext,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Enter no. of Columns',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 80.0, right: 80.0),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 30.0,
                ),
                child: TextField(
                  controller: columntext,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(150, 60)),
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    navigatetogridformationpage();
                  },
                ),
              ),
            ),
          ],
        ),
          ),
        ),
      ),
    );
  }
}
