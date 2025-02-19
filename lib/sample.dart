import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slms/view_model/attendence/attendencecontroller.dart';
import 'package:slms/widget/widget.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Attendencecontroller>(context, listen: false)
        .getAllDataFromAttendenceLog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Attendencecontroller>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.attendenceLogList.length,
          itemBuilder: (context, index) {
            var a = value.attendenceLogList[index];
            return textStyled(text: a.direction.toString());
          },
        ),
      ),
    );
  }
}
