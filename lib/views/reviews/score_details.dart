import 'package:flutter/material.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/views/widget/widget.dart';

class ScoreDetailsPAge extends StatelessWidget {
  const ScoreDetailsPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstents.bagroundColor,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: ColorConstents.bagroundColor,
      ),
      body: Column(
        children: [
          textStyled(text: 'Score Sheet', fontweight: FontWeight.bold),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          textStyled(text: 'WEEK 1'),
                          textStyled(text: 'Review Date'),
                          textStyled(text: 'Review Name'),
                          textStyled(text: 'Review Updation')
                      ],
                    ),

                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          blurStyle: BlurStyle.outer,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    height: 130,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
