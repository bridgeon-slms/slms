import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TopicScreen extends StatelessWidget {
  final String topic;

  const TopicScreen({
    super.key,
    required this.topic,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Topic Details")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              topic,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Gap(500),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Completed!"),
                    content: const Text("You have finished this topic."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context), // Close dialog
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Finish',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
