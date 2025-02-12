import 'package:flutter/material.dart';
import 'package:slms/widget/widget.dart';

class ScoresheetPage extends StatelessWidget {
  const ScoresheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textStyled(text: 'Hi Rinshid'),
                    textStyled(
                        text: 'Attendance Report',
                        fontweight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  ],
                ),
                //befwiuf
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      size: 30,
                    )),
                CircleAvatar(radius: 25)
              ],
            ),
          ],
        ),
      )),
    );
  }
}
