import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/ShirtModel.dart';
import '../utils/Constants.dart';
import '../widget/reuseable_text.dart';
import '../widget/reuseable_button.dart';
import '../widget/shirt_add_to_cart.dart';

class ShirtDetails extends StatefulWidget {
  const ShirtDetails({
    required this.data1,
    super.key,
    required this.isCameFromMostPopularPart,
  });

  final ShirtModel data1;
  final bool isCameFromMostPopularPart;

  @override
  State<ShirtDetails> createState() => _ShirtDetailsState();
}

class _ShirtDetailsState extends State<ShirtDetails> {
  int selectedSize = 3;
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    ShirtModel current = widget.data1;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ListView(
          scrollDirection: Axis.vertical,
          children:[
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Top Image
              SizedBox(
                width: size.width,
                height: size.height * 0.6,
                child: Stack(
                  children: [
                    Hero(
                      tag: widget.isCameFromMostPopularPart
                          ? current.imageUrl
                          : current.id,
                      child: Container(
                        width: size.width,
                        height: double.infinity,

                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          image: DecorationImage(
                              image: AssetImage(current.imageUrl),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: size.height * 0.020,),

              /// info
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              current.name,
                              style: textTheme.headline3?.copyWith(fontSize: 22),
                            ),
                            ReuseableText(
                              price: current.price,
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.035,
                        ),
                        const Text(
                          "PRODUCT DETAILS -",
                          style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          )
                        ),
                        SizedBox(
                          height: size.height * 0.010,
                        ),

                        Text(
                          current.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.035,
                        ),
                        const Text(
                            "UNSTITCHED 1 PIECE",

                            style: TextStyle(
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              // decoration: TextDecoration.underline
                            )
                        ),
                        SizedBox(
                          height: size.height * 0.010,
                        ),
                        Row(
                          children: [

                            const Text('Shirt : ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            Text(
                              current.Shirt,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 15,
                                letterSpacing: 0.5,

                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            const Text('Fabric : ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            Text(
                              current.Fabric,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 15,
                                letterSpacing: 0.5,

                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            const Text('Color : ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            Text(
                              current.Color,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                letterSpacing: 0.5,
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.020,),
                        const Row(
                          children: [
                            Text('Note: ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            Text(
                              "Actual product color may vary slightly from the image.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                        // Text("Fabric"),
                        // Text("Color"),


                      ],
                    ),
                  ),
                ),
              ),

              /// Add To Cart Button
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.03),
                  child: ReuseableButton(
                    text: "Add to cart",
                    onTap: () {
                      ShirtAddToCart.shirtaddtocart(current, context);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.035,
              ),
            ],
          ),
         ]
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: const Icon(
      //       Icons.favorite_border,
      //       color: Colors.white,
      //     ),
      //   ),
      // ],
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ),
      ),
    );
  }
}
