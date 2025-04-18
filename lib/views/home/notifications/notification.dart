import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:slms/view_model/home/home_controller.dart';
import 'package:slms/views/widget/widget.dart';

class NotificationS extends StatefulWidget {
  const NotificationS({super.key});

  @override
  State<NotificationS> createState() => _NotificationSState();
}

class _NotificationSState extends State<NotificationS> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>().getNotification();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Consumer<HomeController>(
        builder: (context, value, child) {
          if (value.notificationLodding) {
            return  Center(
              child: loddingWidget(),
            );
          }

          if (value.notificationResponse?.data == null ||
              value.notificationResponse!.data.isEmpty) {
            return const Center(
              child: Text('No notifications available'),
            );
          }

          return ListView.builder(
            itemCount: value.notificationResponse!.data.length,
            itemBuilder: (BuildContext context, int index) {
              final data = value.notificationResponse!.data[index];
              DateTime utcDateTime =
                  DateTime.parse(data.date.toString()).toUtc();
              DateTime istDateTime =
                  utcDateTime.add(Duration(hours: 5, minutes: 30));

              String formattedDate =
                  DateFormat('dd MMMM yyyy hh:mm a').format(istDateTime);

              return ListTile(
                title: Text(data.message),
                subtitle: Text(formattedDate), // Displaying date

          );},
          );
        },
      ),
    );
  }
}
