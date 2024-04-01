import 'package:animate_do/animate_do.dart';
import 'package:femme_style/wrapScreen.dart';
import 'package:flutter/material.dart';
import '../controllers/cart_controller.dart';
import '../widget/reuseable_button.dart';
import 'cart.dart';
import 'package:get/get.dart';



class OrderDetailScreen extends StatefulWidget{
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {

  @override
  Widget build(BuildContext context) {
    // print('Args Value: ${Get.arguments}');
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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
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
                    child: GetBuilder<CartController>(
                      builder: (controller) {
                        return Text(controller.calculateTotalPrice().toString(), style: const TextStyle(
                          fontSize: 20,
                        ),
                        );
                      }
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
                              builder: (context) => const Cart()));
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
                              builder: (context) => const homeScreen()));
                    }),
              ),
            )

          ],
        ),
      ),
    );
  }
}