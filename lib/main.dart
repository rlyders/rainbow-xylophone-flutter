import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

playSound(int soundNumber) {
  final player = AudioCache();
  player.play('note$soundNumber.wav');
}

class XylophoneBar extends Expanded {
  XylophoneBar(Color color, int note)
      : super(
          child: FlatButton(
            color: color,
            onPressed: () {
              playSound(note);
            },
          ),
        );
}

class RainbowXylophone extends Column {
  static final List<Color> rainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  static List<XylophoneBar> getRainbowXylophoneBars() {
    List<XylophoneBar> rainbowBars = [];
    rainbowColors.asMap().forEach((index, color) {
      XylophoneBar xylophoneBar = XylophoneBar(color, index + 1);
      rainbowBars.add(xylophoneBar);
    });
    return rainbowBars;
  }

  RainbowXylophone()
      : super(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: getRainbowXylophoneBars(),
        );
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: RainbowXylophone(),
        ),
      ),
    );
  }
}
