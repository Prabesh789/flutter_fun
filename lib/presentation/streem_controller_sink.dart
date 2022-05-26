import 'dart:async';

import 'package:flutter/material.dart';

class StreemControllerSink extends StatefulWidget {
  const StreemControllerSink({Key? key, this.title = ''}) : super(key: key);
  final String title;

  @override
  State<StreemControllerSink> createState() => _StreemControllerSinkState();
}

class _StreemControllerSinkState extends State<StreemControllerSink> {
  final controller = StreamController<String>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: StreamBuilder<String>(
          stream: controller.stream,
          builder: (_, snapshot) {
            if (snapshot.data == null && snapshot.error == null) {
              return Text(widget.title);
            } else {
              return Text(snapshot.requireData);
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: TextField(
          decoration: const InputDecoration(hintText: 'Plz eneter text'),
          onChanged: controller.sink.add,
        ),
      ),
    );
  }
}
