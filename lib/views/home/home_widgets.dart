

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/helpers/helpers.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/view_model/home/home_controller.dart';

Widget leetcodeStatisticsCard(HomeController controller) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/image/LeetCode_logo_rvs.png',
                    width: 32,
                    height: 32,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'LeetCode Statistics',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Solved',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${controller.leetcodeModel?.data.acSubmissionNum[0].count ?? 0}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
                Container(width: 1, height: 50, color: Colors.white24),
                difficultyItem(
                  difficulty: controller
                          .leetcodeModel?.data.acSubmissionNum[1].difficulty ??
                      'Easy',
                  count:
                      controller.leetcodeModel?.data.acSubmissionNum[1].count ??
                          0,
                  color: Colors.green,
                ),
                Container(width: 1, height: 50, color: Colors.white24),
                difficultyItem(
                  difficulty: controller
                          .leetcodeModel?.data.acSubmissionNum[2].difficulty ??
                      'Medium',
                  count:
                      controller.leetcodeModel?.data.acSubmissionNum[2].count ??
                          0,
                  color: Colors.orange,
                ),
                Container(width: 1, height: 50, color: Colors.white24),
                difficultyItem(
                  difficulty: controller
                          .leetcodeModel?.data.acSubmissionNum[3].difficulty ??
                      'Hard',
                  count:
                      controller.leetcodeModel?.data.acSubmissionNum[3].count ??
                          0,
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF1E293B),
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.abc),
              label: const Text('View Profile'),
            ),
          ],
        ),
      ),
    );
  }

  Widget difficultyItem({
    required String difficulty,
    required int count,
    required Color color,
  }) {
    return Column(
      children: [
        Text(
          difficulty,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$count',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget modernPaymentsCard() {
    return Consumer<HomeController>(
      builder: (context, value, child) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 12),
                const Text(
                  'Pending Payments',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: value.payments?.data.dueLists.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${value.payments?.data.dueLists[index].feesRecordId.feeStructureId.title}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              formatDate(
                                  value.payments!.data.dueLists[index].dueDate),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '₹${value.payments?.data.dueLists[index].dueAmount.toInt()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
 Widget scoreProgressSection(HomeController controller) {
    if (controller.score?.data == null || controller.score!.data.isEmpty) {
      return const SizedBox();
    }

    final academic = controller.score?.data.first.academic;
    final others = controller.score?.data.first.others;

    double academicMark = (academic?.review ?? 0) + (academic?.task ?? 0);
    double academicPer = (academicMark / 20).clamp(0.0, 1.0);

    double othersMark = (others?.attendance ?? 0) + (others?.discipline ?? 0);
    double othersPer = (othersMark / 20).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          scoreProgressItem(
            label: 'Academic',
            percentage: academicPer,
            color: ColorConstents.primeryColor,
          ),
          Container(
            height: 100,
            width: 1,
            color: Colors.grey[200],
          ),
          scoreProgressItem(
            label: 'Others',
            percentage: othersPer,
            color: ColorConstents.primeryColor,
          ),
        ],
      ),
    );
  }

  Widget scoreProgressItem({
    required String label,
    required double percentage,
    required Color color,
  }) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: percentage,
                strokeWidth: 8,
                backgroundColor: Colors.grey[200],
                color: color,
              ),
            ),
            Column(
              children: [
                Text(
                  '${(percentage * 100).toInt()}%',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Score',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
