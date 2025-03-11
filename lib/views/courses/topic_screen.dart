import 'package:flutter/material.dart';
import 'package:html_parser_plus/html_parser_plus.dart';

class TopicScreen extends StatelessWidget {
  final String topic;

  const TopicScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    var parser = HtmlParser();
    var parsedNode = parser.parse(topic);
    
    return Scaffold(
      appBar: AppBar(title: const Text("Topic Details")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Text(parsedNode.toString()), // Convert the node to string
      ),
    );
  }
}