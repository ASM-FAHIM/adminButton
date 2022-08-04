import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController uidController = TextEditingController();
  TextEditingController classController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              TextField(
                controller: uidController,
                decoration: InputDecoration(hintText: 'Enter uid'),
              ),
              TextField(
                controller: classController,
                decoration: InputDecoration(hintText: 'Enter class'),
              ),
              ElevatedButton(
                onPressed: () async {
                  //api calling
                  var response = await http.post(
                    Uri.parse(
                        'http://172.20.20.69/pick_kids/update_status.php'),
                    body: jsonEncode(
                      <String, String>{
                        "uid": uidController.text,
                        "child_class": classController.text
                      },
                    ),
                  );
                  uidController.clear();
                  classController.clear();
                  print("submit 1 pressed");
                },
                child: Text("Submit 1"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      //api calling
                      var response = await http.post(
                        Uri.parse(
                            'http://172.20.20.69/pick_kids/update_status.php'),
                        body: jsonEncode(
                          <String, String>{"uid": "74", "child_class": "3"},
                        ),
                      );
                      uidController.clear();
                      classController.clear();
                      print("submit 74 3 pressed");
                    },
                    child: Text("74 - 3"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //api calling
                      var response = await http.post(
                        Uri.parse(
                            'http://172.20.20.69/pick_kids/update_status.php'),
                        body: jsonEncode(
                          <String, String>{"uid": "74", "child_class": "1"},
                        ),
                      );
                      uidController.clear();
                      classController.clear();
                      print("submit 74 1 pressed");
                    },
                    child: Text("74 - 1"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
