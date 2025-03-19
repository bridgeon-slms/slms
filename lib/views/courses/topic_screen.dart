import 'package:flutter/material.dart';

class TopicScreen extends StatelessWidget {
  final String topic;

  const TopicScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text("Topic Details")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Text(topic),
      ),
    );
  }
}



