import 'package:flutter/material.dart';
import 'package:flutter_application_1/learn_getx/controllers/tap_controller.dart';
import 'package:flutter_application_1/learn_getx/my_home_page.dart';
import 'package:get/get.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

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
        child: Column(
          children: [
            GetBuilder<TapController>(builder: (_) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => MyHomePage());
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
                      Get.find<TapController>().x.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
