import 'package:flutter/material.dart';
import 'package:slms/utils/color/color.dart';
import 'package:slms/widget/widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstents.bagroundColor,
      appBar: AppBar(
        surfaceTintColor: ColorConstents.bagroundColor,
        backgroundColor: ColorConstents.bagroundColor,
        title: textStyled(text: 'Payment Report', fontSize: 16, fontweight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          textStyled(text: 'Date', fontweight: FontWeight.bold),
                          textStyled(text: 'Type', fontweight: FontWeight.bold),
                          textStyled(text: "Amount", fontweight: FontWeight.bold),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Divider(),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                textStyled(text: '10/08/2024'),
                                textStyled(text: 'Rent'),
                                textStyled(text: "₹3500"),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                   
                  ],
                ),
              ),
              SizedBox(height: 20,),
               Container(
              
                width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
            
                    borderRadius: BorderRadius.circular(8),
                    color: ColorConstents.bagroundColor,
                    boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 5,
                  offset: Offset(2, 2),
                  spreadRadius: 1,
                ),
              ],
                  ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    textStyled(text: "Pending Fee",fontweight: FontWeight.bold,fontSize: 18),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        spacing: 10,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            color: Colors.red,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            color: Colors.yellow,
                          ),
                          Spacer(),
                          textStyled(text: 'Total Balance Amount: ₹10500')
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                        return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                             color: Colors.yellow
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  textStyled(text: 'Training Facility Charge',fontSize: 14),
                                  textStyled(text: 'Pending Amount : 3500',fontSize: 13),
                                ],
                              ),
                              textStyled(text: 'Due Date : 03 Mar 2025')
                            ],
                          ),
                        ),
                      );
                      },),
                    )
                  ],
                ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
