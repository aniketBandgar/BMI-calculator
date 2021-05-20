import 'package:flutter/material.dart';
import 'pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          inactiveTrackColor: Colors.grey,
          activeTrackColor: Colors.white70,
          thumbColor: Color(0xFFFB1555),
          overlayColor: Color(0x29FB1555),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
        ),
        primaryColor: Color(0xFF0F0F1E),
        scaffoldBackgroundColor: Color(0xFF181818),
      ),
      home: InputPage(),
    );
  }
}
