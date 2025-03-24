import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:slms/utils/image/image.dart';
import 'package:slms/view_model/home/home_controller.dart';
import 'package:slms/views/ProfilePage/profilepage.dart';
import 'package:slms/views/error/error.dart';
import 'package:slms/views/home/home_widgets.dart';
import 'package:slms/views/home/notifications/notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeController>(context, listen: false).fetchAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);


    return Consumer<HomeController>(
      builder: (context, homeController, _) {
        if (homeController.isLoading) {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        }

        if (homeController.isError) {
          return Errorpage(
            onRefresh: homeController.fetchAllData,
          );
        }

        return Scaffold(
          backgroundColor: const Color(0xFFF5F7FA),
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            leadingWidth: 60,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Image.asset(
                ImageConstents.bridgeonLogo,
              ),
            ),
            actions: [
    
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationS()),
                  );
                },
                icon: Badge(
                  isLabelVisible: true,
                  label: const Text('0',
                      style: TextStyle(color: Colors.white, fontSize: 10)),
                  child: const Icon(Iconsax.notification,
                      color: Color(0xFF2D3748)),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          body: RefreshIndicator(
            color: Theme.of(context).primaryColor,
            onRefresh: () async {
              await homeController.fetchAllData();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Profile Card
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()),
                            );
                          },
                          child: Hero(
                            tag: 'profile',
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey[100],
                                backgroundImage:
                                    homeController.profile?.image != null
                                        ? NetworkImage(
                                            homeController.profile!.image)
                                        : null,
                                child: homeController.profile?.image == null
                                    ? const Icon(Icons.person,
                                        size: 30, color: Colors.grey)
                                    : null,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Hello, ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  homeController.profile?.name ?? 'User',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2D3748),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Welcome back!',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),

                  // Score Cards
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Performance ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                        ),
                        performanceMetricsSection(homeController),
                        const SizedBox(height: 24),
                        const Text(
                          'Total Score',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D3748),
                          ),
                        ),
                        const SizedBox(height: 16),
                        scoreProgressSection(homeController),
                        const SizedBox(height: 24),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Others',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D3748),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        modernPaymentsCard(),
                        const SizedBox(height: 24),
                        leetcodeStatisticsCard(homeController),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget performanceMetricsSection(HomeController controller) {
    final academic = controller.score?.data.first.academic;
    final others = controller.score?.data.first.others;

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        metricCard(
          icon: Iconsax.document_text,
          title: 'Review',
          value: "${academic!.review.toInt() * 10}%",
          color: const Color(0xFF4338CA),
        ),

        metricCard(
          icon: Iconsax.task_square,
          title: 'Task',
          value: "${academic.task.toInt() * 10}%",
          color: const Color(0xFF0EA5E9),
        ),
        metricCard(
          icon: Iconsax.user_tick,
          title: 'Attendance',
          value: "${others!.attendance.toInt() * 10}%",
          color: const Color(0xFF10B981),
        ),

        metricCard(
          icon: Iconsax.teacher,
          title: 'Discipline',
          value: "${others.discipline.toInt() * 10}%",
          color: const Color(0xFFF59E0B),
        ),
      ],
    );
  }

  Widget metricCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
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
      child: Stack(
        children: [
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } 
}
