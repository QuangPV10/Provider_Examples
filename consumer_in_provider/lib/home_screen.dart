import 'package:consumer_in_provider/my_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Consumer<MySetting>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value.text.toUpperCase(),
                style: TextStyle(fontSize: value.getFontSize, color: value.color),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        value.changeColor();
                      },
                      child: const Text('Change Color')),
                  ElevatedButton(
                      onPressed: () {
                        value.changeText();
                      },
                      child: const Text('Change Text'))
                ],
              ),
              const SizedBox(height: 30),
              Slider(
                value: value.getSliderFontSize,
                min: 0.5,
                onChanged: (sliderFontSize) {
                  value.setFontSize = sliderFontSize;
                },
              )
            ],
          );
        },
      ),
    );
  }
}
