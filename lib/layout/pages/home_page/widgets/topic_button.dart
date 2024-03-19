// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class TopicButton extends StatelessWidget {
  const TopicButton({
    super.key,
    required this.topic,
  });

  final String topic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Tapped on $topic');
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.amberAccent,
        child: Text(
          topic,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
