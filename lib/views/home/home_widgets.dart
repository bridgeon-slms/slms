import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:slms/helpers/helpers.dart';
import 'package:slms/model/dashboard.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/home/home_controller.dart';
import 'package:slms/views/widget/widget.dart';

CircularPercentIndicator circulePercentange(
  double percent,
) {
  return CircularPercentIndicator(
    animation: true,
    animationDuration: 1000,
    radius: 60.0,
    lineWidth: 13.0,
    percent: percent,
    center: textStyled(
        text: '${(percent * 100).toStringAsFixed(0)}%',
        fontweight: FontWeight.bold),
    progressColor: Colors.blue,
    backgroundColor: Colors.grey.shade300,
    circularStrokeCap: CircularStrokeCap.round,
  );
}

// ignore: must_be_immutable, camel_case_types
class attendaceContainer extends StatelessWidget {
  IconData icon;
  String percetange;
  String text;

  attendaceContainer({
    required this.percetange,
    required this.text,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.shade400,
            )),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  icon,
                  color: Colors.white,
                )),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textStyled(
                    text: text, fontweight: FontWeight.bold, fontSize: 15),
                textStyled(text: percetange)
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget leaderBoardWidget(BuildContext context, List<LeaderboardData> data) {
  if (data.isEmpty) {
    return Center(
      child: Text('no data available'),
    );
  }
  return Container(
    width: double.infinity,
    height: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0XFFD1B0EE),
          Color(0xFF7024DB),
        ],
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: Color(0XFF111946),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Color(0XFF343C6A),
              ),
              width: MediaQuery.of(context).size.width / 3.3,
              height: 180,
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 15,
          top: 75,
          child: SizedBox(
            width: 70,
            height: 70,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  data[1].studentId?.image ?? '',
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
          top: 75,
          right: MediaQuery.of(context).size.width / 15,
          child: SizedBox(
            height: 70,
            width: 70,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  data[2].studentId?.image ?? '',
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2.55,
          top: 30,
          child: SizedBox(
            height: 70,
            width: 70,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  data[0].studentId?.image ?? '',
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
            top: 130,
            child: textStyled(
                text: data[0].totalScore.toString(), color: Color(0XFFFFD701)))
      ],
    ),
  );
}

Widget pendingPayments() {
  return Consumer<HomeController>(builder: (context, controller, child) {
    // Handle null or empty data
    if (controller.payments == null ||
        controller.payments?.data.dueLists == null) {
      return Container(
        width: double.infinity,
        height: 400,
        decoration: _buildContainerDecoration(),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    try {
      final paymentData = controller.payments!.data.dueLists;
      double totalBalance = 0;

      try {
        totalBalance = paymentData.fold<double>(
            0, (sum, payment) => sum + (payment.balance));
      // ignore: empty_catches
      } catch (e) {
      }

      return Container(
        width: double.infinity,
        height: 350,
        decoration: _buildContainerDecoration(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            textStyled(
                text: "Pending Fee", fontweight: FontWeight.bold, fontSize: 18),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.yellow,
                  ),
                  const Spacer(),
                  textStyled(
                      text:
                          'Total Balance Amount: ₹${totalBalance.toStringAsFixed(2)}')
                ],
              ),
            ),
            Expanded(
              child: paymentData.isEmpty
                  ? const Center(
                      child: Text('No pending payments'),
                    )
                  : ListView.builder(
                      itemCount: paymentData.length,
                      itemBuilder: (context, index) {
                        try {
                          final payment = paymentData[index];
                          final formattedDate = formatDate(payment.dueDate);

                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0XFFE9EC71)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      textStyled(
                                          text: payment.feesRecordId
                                              .feeStructureId.title,
                                          fontSize: 14),
                                      textStyled(
                                          text:
                                              'Pending Amount : ₹${payment.balance.toStringAsFixed(2)}',
                                          fontSize: 13),
                                    ],
                                  ),
                                  textStyled(text: 'Due Date : $formattedDate')
                                ],
                              ),
                            ),
                          );
                        } catch (e) {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
            )
          ],
        ),
      );
    } catch (e) {
      return Container(
        width: double.infinity,
        height: 400,
        decoration: _buildContainerDecoration(),
        child: const Center(
          child: Text('Error loading payment data'),
        ),
      );
    }
  });
}

// Helper function for container decoration
BoxDecoration _buildContainerDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: ColorConstents.bagroundColor,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade400,
        blurRadius: 5,
        offset: const Offset(2, 2),
        spreadRadius: 1,
      ),
    ],
  );
}
