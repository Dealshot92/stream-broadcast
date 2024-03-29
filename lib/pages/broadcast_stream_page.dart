import 'dart:async';

import 'package:flutter/material.dart';

class BroadcastStreamPage extends StatefulWidget {
  const BroadcastStreamPage({super.key});

  @override
  State<BroadcastStreamPage> createState() => _BroadcastStreamPageState();
}

class _BroadcastStreamPageState extends State<BroadcastStreamPage> {

  final StreamController<String> singleController=StreamController.broadcast();
  String firstStream="No data";
  String secondStream="No data";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addStreamData();
  }

  addStreamData()async{
    singleController.stream.listen((data) {
      setState(() {
        firstStream=data;
      });
    });

    singleController.stream.listen((data) {
      setState(() {
        secondStream=data;
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
              firstStream,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              secondStream,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
