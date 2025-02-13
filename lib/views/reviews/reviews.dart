// // // import 'package:flutter/material.dart';
// // // import 'package:slms/utils/color/color.dart';
// // // import 'package:slms/widget/widget.dart';

// // // class Reviewspage extends StatelessWidget {
// // //   const Reviewspage({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: ColorConstents.bagroundColor,
// // //       appBar: AppBar(
// // //         surfaceTintColor: ColorConstents.bagroundColor,
// // //         backgroundColor: ColorConstents.bagroundColor,
// // //         title: textStyled(
// // //             text: 'Review Report', fontSize: 16, fontweight: FontWeight.bold),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Column(
// // //           children: [
// // //             Row(

// // //             )
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:slms/utils/color/color.dart';
// // import 'package:slms/views/reviews/reviewchart.dart';
// // import 'package:slms/widget/widget.dart';

// // class Reviewspage extends StatelessWidget {
// //   const Reviewspage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: ColorConstents.bagroundColor,
// //       appBar: AppBar(
// //         surfaceTintColor: ColorConstents.bagroundColor,
// //         backgroundColor: ColorConstents.bagroundColor,
// //         title: textStyled(
// //             text: 'Review Report', fontSize: 16, fontweight: FontWeight.bold),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             const SizedBox(height: 20),
// //             buildReviewContainer(
// //               icon: Icons.person,
// //               title: " Reviewer",
// //               subtitle: "Assigned",
// //             ),
// //             const SizedBox(height: 15),
// //             buildReviewContainer(
// //               icon: Icons.lock_clock,
// //               title: "Review Date",
// //               subtitle: "jan 25",
// //             ),
// //             SizedBox(
// //               height: 30,
// //             ),
// //             Container(height: 300, child: BarChartSample2())
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildReviewContainer({
// //     required IconData icon,
// //     required String title,
// //     required String subtitle,
// //   }) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(horizontal: 20),
// //       padding: const EdgeInsets.all(15),
// //       decoration: BoxDecoration(
// //         border: Border.all(color: Colors.grey, width: 1.5),
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       child: Row(
// //         children: [
// //           Icon(icon, size: 30, color: Colors.blue),
// //           const SizedBox(width: 15),
// //           Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(title,
// //                   style: const TextStyle(
// //                       fontSize: 16, fontWeight: FontWeight.bold)),
// //               Text(subtitle,
// //                   style: const TextStyle(fontSize: 14, color: Colors.grey)),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:slms/utils/color/color.dart';
// import 'package:slms/views/reviews/reviewchart.dart';
// import 'package:slms/widget/widget.dart';

// class Reviewspage extends StatelessWidget {
//   const Reviewspage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstents.bagroundColor,
//       appBar: AppBar(
//         surfaceTintColor: ColorConstents.bagroundColor,
//         backgroundColor: ColorConstents.bagroundColor,
//         title: textStyled(
//             text: 'Review Report', fontSize: 16, fontweight: FontWeight.bold),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             buildReviewContainer(
//               icon: Icons.person,
//               title: " Reviewer",
//               subtitle: "Assigned",
//             ),
//             const SizedBox(height: 15),
//             buildReviewContainer(
//               icon: Icons.lock_clock,
//               title: "Review Date",
//               subtitle: "jan 25",
//             ),
//             const SizedBox(height: 30),
//             Text('Reviews history'),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: SizedBox(
//                 width: double.infinity,
//                 height: 400,
//                 child: Center(
//                   child: BarChartSample2(),
//                 ),
//               ),
//             ),
//             Text('Score Details'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildReviewContainer({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//   }) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey, width: 1.5),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: 30, color: Colors.blue),
//           const SizedBox(width: 15),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title,
//                   style: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.bold)),
//               Text(subtitle,
//                   style: const TextStyle(fontSize: 14, color: Colors.grey)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/views/reviews/reviewchart.dart';
import 'package:slms/widget/widget.dart';

class Reviewspage extends StatelessWidget {
  const Reviewspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstents.bagroundColor,
      appBar: AppBar(
        surfaceTintColor: ColorConstents.bagroundColor,
        backgroundColor: ColorConstents.bagroundColor,
        title: textStyled(
            text: 'Review Report', fontSize: 16, fontweight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            buildReviewContainer(
              icon: Icons.person,
              title: " Reviewer",
              subtitle: "Assigned",
            ),
            const SizedBox(height: 15),
            buildReviewContainer(
              icon: Icons.lock_clock,
              title: "Review Date",
              subtitle: "Jan 25",
            ),
            const SizedBox(height: 30),
            const Text('Reviews history',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: Center(
                  child: BarChartSample2(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text('Score Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            buildScoreSheet(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    label: Row(
                      children: [
                        Text('More Details'),
                        Icon(Icons.arrow_forward)
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildReviewContainer({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Text(subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildScoreSheet() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                'Academic',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DataTable(
                columns: const [
                  DataColumn(
                      label: Text('Week',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13))),
                  DataColumn(
                      label: Text('Review',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13))),
                  DataColumn(
                      label: Text('Task',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13))),
                  DataColumn(
                      label: Text('Score',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13))),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('8')),
                    DataCell(Text('8')),
                    DataCell(Text('16')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2')),
                    DataCell(Text('7.5')),
                    DataCell(Text('7')),
                    DataCell(Text('14.5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3')),
                    DataCell(Text('7')),
                    DataCell(Text('7')),
                    DataCell(Text('14')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('4')),
                    DataCell(Text('6.5')),
                    DataCell(Text('7',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue))),
                    DataCell(Text('13.5')),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
