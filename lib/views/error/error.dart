import 'package:flutter/material.dart';

class Errorpage extends StatefulWidget {
  const Errorpage({super.key});

  @override
  State<Errorpage> createState() => _ErrorpageState();
}

class _ErrorpageState extends State<Errorpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 60,
              color: const Color.fromARGB(255, 198, 197, 197),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Can't reach the internet",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Check your connection and try again",
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.restart_alt,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
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
