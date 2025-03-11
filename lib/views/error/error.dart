import 'package:flutter/material.dart';
import 'package:slms/utils/color/color.dart';

class Errorpage extends StatefulWidget {
  final VoidCallback onRefresh;

  const Errorpage({super.key, required this.onRefresh});

  @override
  State<Errorpage> createState() => _ErrorpageState();
}

class _ErrorpageState extends State<Errorpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstents.bagroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 60,
              color: Color.fromARGB(255, 198, 197, 197),
            ),
            const SizedBox(height: 20),
            const Text(
              "Can't reach the internet",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Check your connection and try again",
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: widget.onRefresh,
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.restart_alt,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Try again",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
