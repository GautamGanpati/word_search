import 'package:flutter/material.dart';
import 'package:word_search/listgenerator_page.dart';

class GridformationPage extends StatefulWidget {
  final int rowtext;
  final int columntext;
  const GridformationPage(
      {super.key, required this.rowtext, required this.columntext});

  @override
  State<GridformationPage> createState() => _GridformationPageState();
}

class _GridformationPageState extends State<GridformationPage> {
  List<String> listData = [];

  List<TextEditingController> listcontroller = [];

  @override
  Widget build(BuildContext context) {
    List<List<TextEditingController>> myController = List.generate(
        (widget.rowtext),
        (i) => List.generate(widget.columntext, (index) {
              return TextEditingController();
            }));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 5,
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: false,
          title: Text(
            'Grid Formation',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Table(
                    children: [
                      for (int i = 0; i < widget.rowtext; i++)
                        TableRow(children: [
                          for (int j = 0; j < widget.columntext; j++)
                            Padding(
                              padding:
                                  const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: myController[i][j],
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(150, 60)),
                      child: Text(
                        'Form Grid',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ListgenratorPage(
                              mycontroller: myController,
                              columntext: widget.columntext,
                              rowtext: widget.rowtext,
                            ),
                          ),
                        );
                      },
                    ),

                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
