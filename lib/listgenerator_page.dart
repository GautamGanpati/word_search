import 'package:flutter/material.dart';

class ListgenratorPage extends StatefulWidget {
  final int rowtext;
  final int columntext;
  final List<List<TextEditingController>> mycontroller;
  const ListgenratorPage({
    Key? key,
    required this.mycontroller,
    required this.rowtext,
    required this.columntext,
  }) : super(key: key);

  @override
  State<ListgenratorPage> createState() => _ListgenratorPageState();
}

class _ListgenratorPageState extends State<ListgenratorPage> {
  final TextEditingController searchtext = TextEditingController();

  List<int> x = [-1, -1, -1, 0, 0, 1, 1, 1];
  List<int> y = [-1, 0, 1, -1, 1, -1, 0, 1];
  int rd = 0, cd = 0;

  bool search2D(List<List<TextEditingController>> grid, int row, int col,
      String word, int R, int C) {
    if (grid[row][col].text != word[0]) return false;

    int len = word.length;

    for (int dir = 0; dir < 8; dir++) {
      int k;
      rd = 0;
      cd = 0;
      rd = row + x[dir];
      cd = col + y[dir];

      for (k = 1; k < len; k++) {
        if (rd >= R || rd < 0 || cd >= C || cd < 0) break;

        if (grid[rd][cd].text != word[k]) break;

        rd += x[dir];
        cd += y[dir];
      }

      if (k == len) return true;
    }
    return false;
  }

  List<List<int>> savecordinates = [];

  bool patternsearch(
      List<List<TextEditingController>> grid, String word, int R, int C) {
    for (int row = 0; row < R; row++) {
      for (int col = 0; col < C; col++) {
        if (search2D(grid, row, col, word, R, C)) {
          Text(
            widget.mycontroller[row][col].text,
            style: const TextStyle(color: Colors.redAccent),
          );

          if (row == rd) {
            for (int i = col; i <= word.length; i++) {
              savecordinates.add([row, i]);
            }
          }

          if (col == cd) {
            for (int i = row; i <= word.length; i++) {
              savecordinates.add([i, col]);
            }
          }

          return true;
        }
      }
    }
    return false;
  }

  bool highlighttext(int i, int j) {
    for (List<int> coordinates in savecordinates) {
      if (coordinates[0] == i && coordinates[1] == j) {
        return true;
      }
    }
    return false;
  }

  void clearcordinates() {
    setState(() {
      savecordinates.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
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
          title: const Text(
            'Grid Formation',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Table(
                  children: [
                    for (int i = 0; i < widget.rowtext; i++)
                      TableRow(children: [
                        for (int j = 0; j < widget.columntext; j++)
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                highlighttext(i, j)
                                    ? Container(
                                        height: 70,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.blue,
                                              ),
                                            ]),
                                        child: Center(
                                          child: Text(
                                            widget.mycontroller[i][j].text,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 70,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                              ),
                                            ]),
                                        child: Center(
                                          child: Text(
                                            widget.mycontroller[i][j].text,
                                          ),
                                        ),
                                      )
                                // Text(
                                //     widget.mycontroller[i][j].text,
                                //   ),
                              ],
                            ),
                          ),
                      ]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: TextField(
                      controller: searchtext,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Word to be searched',
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 60)),
                    onPressed: () {
                      clearcordinates();
                      bool gotWord = patternsearch(widget.mycontroller,
                          searchtext.text, widget.rowtext, widget.columntext);
                      if (gotWord) {
                        setState(() {});
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) => const AlertDialog(
                                  title: Text('Word not found'),
                                ));
                      }
                    },
                    child: const Text(
                      'Search',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 60)),
                    onPressed: () {
                      clearcordinates();
                      setState(() {
                        searchtext.clear();
                      });
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
