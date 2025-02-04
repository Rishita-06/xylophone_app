import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future<void> playsound(int soundNumber) async {
      AudioCache.instance = AudioCache(prefix: '');
      final player = AudioPlayer();
      await player.play(AssetSource('assets/note$soundNumber.wav'));
    }

    Expanded button({required Color color, required int soundNumber}) {
      return Expanded(
        child: Container(
          color: color,
          child: TextButton(
            onPressed: () {
              playsound(soundNumber);
            },
            child: const Text(''),
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  button(color: Colors.red, soundNumber: 1),
                  button(color: Colors.orange, soundNumber: 2),
                  button(color: Colors.yellow, soundNumber: 3),
                  button(color: Colors.green, soundNumber: 4),
                  button(color: Colors.teal, soundNumber: 5),
                  button(color: Colors.blue, soundNumber: 6),
                  button(color: Colors.purple, soundNumber: 7),
                ]),
          ),
        ),
      ),
    );
  }
}
