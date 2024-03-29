import 'dart:async';

import 'package:flutter/material.dart';

class SingleStreamPage extends StatefulWidget {
  const SingleStreamPage({super.key});

  @override
  State<SingleStreamPage> createState() => _SingleStreamPageState();
}

class _SingleStreamPageState extends State<SingleStreamPage> {

  final StreamController<String> singleController=StreamController();
  String singleStream="No data";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addStreamData();
  }

  addStreamData()async{
    singleController.stream.listen((data) {
      setState(() {
        singleStream=data;
      });
    });
    await addDelayedData("Hello");
    await addDelayedData("World");
    await addDelayedData("How");
    await addDelayedData("Are");
    await addDelayedData("You");
    await addDelayedData("Boys");
  }

  Future<void> addDelayedData(String data) async{
    await Future.delayed(Duration(seconds: 1));
    singleController.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Single Stream"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              singleStream,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
