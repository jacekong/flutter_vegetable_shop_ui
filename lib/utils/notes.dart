// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:final_exam/model/notes_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  void savePost() {
    Navigator.of(context).pop();
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialogbox(
            onPost: savePost,
            onDiscard: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Object>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            //return progress
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            //return widget
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 15, bottom: 15, right: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color.fromARGB(255, 64, 157, 68),
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // title
                          Padding(
                            padding: EdgeInsets.only(left: 7, top: 7),
                            child: Text(
                              notes[index].title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                          Divider(
                            color: Colors.green[100],
                            thickness: 2,
                          ),
                          // notes
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, bottom: 25, top: 7),
                            child: Text(
                              notes[index].content,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ]),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        // ignore: sort_child_properties_last
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  // fetch data from server
  Future<String> get(url) async {
    //1. convert param dict to json
    //2. send post request
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return res.body;
    }
    //no success
    else {
      // ignore: avoid_print
      print(res.statusCode);
      return Future<String>.value(null);
    }
  } //ef

  //fetch data
  List<NotesModel> notes = [];
  List<NotesModel> get _notes => notes;
  void setPost(List<NotesModel> notes) {
    setState(() {
      notes = _notes;
    });
  } //ef

  Future<List<NotesModel>> fetchData({bool refresh = false}) async {
    if (notes.isEmpty || refresh == true) {
      notes = [];
      var url = "http://192.168.80.168:1880/notes";

      var res = await get(url);
      var dict = json.decode(res.toString()) as List;
      notes = dict.map((e) => NotesModel.fromMap(e)).toList();
      return notes;
    } else {
      return notes;
    }
  } //ef
}

// ignore: must_be_immutable
class Dialogbox extends StatelessWidget {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  VoidCallback onPost;
  VoidCallback onDiscard;

  Dialogbox({Key? key, required this.onPost, required this.onDiscard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              // make title
              const Padding(
                padding: EdgeInsets.only(bottom: 7),
                child: Text(
                  "Title:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "What to eat today?",
                ),
              ),
              const SizedBox(height: 20),
              // get post contetn
              TextField(
                controller: _contentController,
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: "what do you want to buy?",
                ),
              ),
              const SizedBox(height: 50),
              // buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // post
                  MaterialButton(
                    onPressed: () {
                      onPost();
                      sendData(
                        _titleController.text.replaceAll("'", "''"),
                        _contentController.text.replaceAll("'", "''"),
                      );
                    },
                    // ignore: sort_child_properties_last
                    child: Text("Noted", style: TextStyle(color: Colors.white)),
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 7),
                  // discard
                  MaterialButton(
                    onPressed: () {
                      onDiscard();
                    },
                    // ignore: sort_child_properties_last
                    child:
                        Text("Discard", style: TextStyle(color: Colors.white)),
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// upload data to db
Future<void> sendData(title, content) async {
  //1. define url
  var url = "http://192.168.80.168:1880/postNotes";

  //2. convert list of objects to list of dictionary
  var data1 = {"title": title, "content": content};

  //3. send request along with the data
  //headers is required
  //data need to be encoded to json text
  await http.post(
    Uri.parse(url),
    headers: {'Content-type': 'application/json'},
    body: json.encode(data1),
  );
  //print(response.body);
} //ef

