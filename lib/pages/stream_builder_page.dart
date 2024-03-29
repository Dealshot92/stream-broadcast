import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({super.key});

  @override
  State<StreamBuilderPage> createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {

  final StreamController<String> singleController=StreamController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addStreamData();
  }

  addStreamData()async{

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
      body: StreamBuilder<String>(
        stream: singleController.stream,
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.active){
            return Center(
              child: Text(
                snapshot.data!,
                textScaleFactor: 2,
              ),
            );
          }else{
            return Center(
            child: Text(
            snapshot.data!,
          textScaleFactor: 2,
          ),
          );
          }
        },
      )
    );
  }
}
