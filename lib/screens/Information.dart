import 'package:animate_do/animate_do.dart';
import 'package:femme_style/wrapScreen.dart';
import 'package:flutter/material.dart';
import '../widget/reuseable_button.dart';
import 'cart.dart';
import 'package:get/get.dart';
import 'home.dart';



class Info extends StatefulWidget{

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final Cart controller = Get.put(Cart());
  @override
  Widget build(BuildContext context) {
    // print(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ) ,),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [

                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text("Your Total bill is ", style: TextStyle(
                      fontSize: 20,
                    ),
                    ),
                  ),
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(controller.calculateTotalPrice(), style: TextStyle(
                      fontSize: 20,
                    ),
                    ),
                  ),
                ),

              ],
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ReuseableButton(
                    text: "View Order Summary",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cart()));
                    }),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 350),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ReuseableButton(
                    text: "Continue Shopping",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homeScreen()));
                    }),
              ),
            )

          ],
        ),
      ),
    );
  }
}