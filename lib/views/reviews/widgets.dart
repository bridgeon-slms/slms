import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:slms/model/ReviewModel/review.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/attendence/attendencecontroller.dart';
import 'package:slms/views/reviews/score_details.dart';
import 'package:slms/widget/widget.dart';

Widget weekCard({required ReviewData data}) {
  return Card(
    color: Colors.white,
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: ExpansionTile(
        title: Text(
          'Week ${data.week}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent.withAlpha(70),
          child: const Icon(Icons.calendar_today, color: Colors.blueAccent),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Consumer<Attendencecontroller>(
              builder: (context, value, child) => Column(
                spacing: 15,
                children: [
                  detailRow(
                      'Review Date',
                      '${value.changeDateForListing(data.reviewDate)}',
                      Icons.access_time),
                  detailRow(
                      'Reviewer', '${data.reviewerName?.name}', Icons.person),
                  data.isWeekBack!
                      ? detailRow('Status', 'WeekBack', Icons.check_circle,
                          valueColor: Colors.red)
                      : detailRow('Status', 'Completed', Icons.check_circle,
                          valueColor: Colors.green),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: ColorConstents.primeryColor),
                                  borderRadius: BorderRadius.circular(5)),
                              minimumSize: Size(50, 50)),
                          onPressed: () {
                            showStudentDetails(
                                context,
                                data,
                                data.academic?.review,
                                data.academic?.task,
                                data.others?.attendance,
                                data.others?.discipline);
                          },
                          child: Row(
                            children: [
                              textStyled(
                                  text: 'Show details',
                                  color: ColorConstents.primeryColor),
                              Icon(Icons.arrow_right)
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget detailRow(String label, String value, IconData icon,
    {Color? valueColor}) {
  return Row(
    children: [
      Icon(icon, size: 24, color: Colors.blueAccent),
      const SizedBox(width: 12),
      Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
      ),
      const Spacer(),
      Text(
        value,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: valueColor ?? Colors.black87,
        ),
      ),
    ],
  );
}

Widget scoreRow(String label, int score, int total) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          Text(
            '$score/$total',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      const SizedBox(height: 8),
    ],
  );
}

