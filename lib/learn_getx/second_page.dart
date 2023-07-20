import 'package:flutter/material.dart';
import 'package:flutter_application_1/learn_getx/controllers/tap_controller.dart';
import 'package:flutter_application_1/learn_getx/third_page.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Center(
          child: GestureDetector(
            onTap: () {
              Get.to(() => ThirdPage());
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF89dad0)),
              child: Center(
                child: Text(
                  "Next to Third Page",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
