import 'package:flutter/material.dart';
import 'package:flutter_fun/app_data/app_data.dart';
import 'package:flutter_fun/presentation/stream_controller_sink.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: homeScreenChildreenData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final data = homeScreenChildreenData[index];
          return ElevatedButton(
            child: Text('${data['buttonText']}'),
            onPressed: () {
              if (index == 0) {
                Navigator.of(context).push<StreamControllerSink>(
                  MaterialPageRoute(
                    builder: (_) => const StreamControllerSink(title: '🤣🤣'),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
