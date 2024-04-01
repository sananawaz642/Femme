
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../models/TrouserModel.dart';
import '../widget/reuseable_text.dart';
import '../widget/reuseable_button.dart';
import '../widget/trouser_add_to_cart.dart';

class TrouserDetails extends StatefulWidget {
  const TrouserDetails({
    required this.data2,
    super.key,
    required this.isCameFromMostPopularPart,
  });

  final TrouserModel data2;
  final bool isCameFromMostPopularPart;

  @override
  State<TrouserDetails> createState() => _TrouserDetailsState();
}

class _TrouserDetailsState extends State<TrouserDetails> {
  int selectedSize = 3;
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var textTheme = Theme.of(context).textTheme;

    TrouserModel current = widget.data2;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      // appBar: _buildAppBar(context),
      body:
        Stack(
          children: [
            Positioned(
              left: 0,
                top: 0,
                // bottom: 0,
                height: size.height * 0.65,
                width: size.width,
                child: Hero(
                  tag: widget.isCameFromMostPopularPart
                      ? current.imageUrl
                      : current.id,
                  child: Container(
                    width: size.width,
                    height: size.height,

                    decoration:
                    BoxDecoration(
                      // borderRadius: const BorderRadius.only(
                      //   bottomLeft: Radius.circular(30),
                      //   bottomRight: Radius.circular(30),
                      // ),
                      image: DecorationImage(
                          image: AssetImage(current.imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
            ),
            Positioned(
              top: height * 0.04,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                ),),
            Positioned(
              top: height * 0.62,
                left: 0,
                width: size.width,
                child: Container(
                  // height: size.height * 0.70,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),

                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              current.name,
                              style: textTheme.displaySmall?.copyWith(fontSize: 19,
                                  fontWeight: FontWeight.bold),
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
                            "Straight Pants",

                            style: TextStyle(
                              // letterSpacing: 1,
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
                                // letterSpacing: 0.5,

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
                                // letterSpacing: 0.5,
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.035,
                        ),

                        const Text(
                            "SIZE & FIT",

                            style: TextStyle(
                              // letterSpacing: 1,
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

                            const Text('Model height : ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            Text(
                              current.height,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 15,
                                // letterSpacing: 0.5,

                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Model Wears : ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            Text(
                              current.wear,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                // letterSpacing: 0.5,
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.020,),
                        Container(
                          child: Row(
                            children: [
                              const Text('Note : ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),

                              ),
                              Text(
                                current.note,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  // letterSpacing: 0.5,
                                    fontSize: 15
                                ),
                              ),
                            ],
                          ),
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 800),
                          child: Padding(
                            padding: EdgeInsets.only(top: size.height * 0.03),
                            child: ReuseableButton(
                              text: "Add to cart",
                              onTap: () {
                                TrouserAddToCart.Trouseraddtocart(current, context);
                              },
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                ),
              ]
            ),
        );
      // SizedBox(
      //   width: size.width,
      //   height: size.height,
      //   child: ListView(
      //       scrollDirection: Axis.vertical,
      //       children:[
      //         Stack(
      //           children: [
      //             Positioned(
      //               top: 10,
      //               left: 10,
      //               child: IconButton(
      //               onPressed: () {
      //                 Navigator.pop(context);
      //               },
      //               icon: const Icon(
      //                 Icons.arrow_back_rounded,
      //                 color: Colors.black,
      //               ),
      //             ),
      //             ),
      //             Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               ///Top Image
      //               SizedBox(
      //                 width: size.width,
      //                 height: size.height * 0.4,
      //                 child: Stack(
      //                   children: [
      //                     Hero(
      //                       tag: widget.isCameFromMostPopularPart
      //                           ? current.imageUrl
      //                           : current.id,
      //                       child: Container(
      //                         width: size.width,
      //                         height: size.height,
      //
      //                         decoration:
      //                         BoxDecoration(
      //                           // borderRadius: const BorderRadius.only(
      //                           //   bottomLeft: Radius.circular(30),
      //                           //   bottomRight: Radius.circular(30),
      //                           // ),
      //                           image: DecorationImage(
      //                               image: AssetImage(current.imageUrl),
      //                               fit: BoxFit.cover),
      //                         ),
      //                       ),
      //                     ),
      //
      //                   ],
      //                 ),
      //               ),
      //               SizedBox(height: size.height * 0.020,),
      //               // okay, pahle mere bat sune ... me abhi dekha mere image already stack me thi to mene info ko postion de ha
      //               /// info
      //               Positioned(
      //                 top: 50,
      //                 child: FadeInUp(
      //                   delay: const Duration(milliseconds: 300),
      //                   child: Padding(
      //                     padding: const EdgeInsets.symmetric(horizontal: 10),
      //                     child: SizedBox(
      //
      //                       width: size.width,
      //                       child: Container(
      //                         decoration: const BoxDecoration(
      //
      //                           borderRadius: BorderRadius.only(
      //                             topLeft: Radius.circular(30),
      //                             topRight: Radius.circular(30)
      //                           ),
      //                         ),
      //                         child: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Text(
      //                                   current.name,
      //                                   style: textTheme.headline3?.copyWith(fontSize: 22),
      //                                 ),
      //                                 ReuseableText(
      //                                   price: current.price,
      //                                 )
      //                               ],
      //                             ),
      //                             SizedBox(
      //                               height: size.height * 0.035,
      //                             ),
      //                             const Text(
      //                                 "PRODUCT DETAILS -",
      //                                 style: TextStyle(
      //                                     letterSpacing: 1,
      //                                     fontWeight: FontWeight.bold,
      //                                     fontSize: 18
      //                                 )
      //                             ),
      //                             SizedBox(
      //                               height: size.height * 0.010,
      //                             ),
      //
      //                             Text(
      //                               current.description,
      //                               textAlign: TextAlign.justify,
      //                               style: const TextStyle(
      //                                 letterSpacing: 0.5,
      //                                 fontSize: 15,
      //                               ),
      //                             ),
      //                             SizedBox(
      //                               height: size.height * 0.035,
      //                             ),
      //                             const Text(
      //                                 "Straight Pants",
      //
      //                                 style: TextStyle(
      //                                   // letterSpacing: 1,
      //                                   fontWeight: FontWeight.bold,
      //                                   fontSize: 18,
      //                                   // decoration: TextDecoration.underline
      //                                 )
      //                             ),
      //                             SizedBox(
      //                               height: size.height * 0.010,
      //                             ),
      //
      //                             Row(
      //                               children: [
      //
      //                                 const Text('Fabric : ',
      //                                   style: TextStyle(
      //                                     fontSize: 15,
      //                                     fontWeight: FontWeight.bold,
      //                                   ),
      //
      //                                 ),
      //                                 Text(
      //                                   current.Fabric,
      //                                   textAlign: TextAlign.justify,
      //                                   style: const TextStyle(
      //                                     fontSize: 15,
      //                                     // letterSpacing: 0.5,
      //
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                             Row(
      //                               children: [
      //
      //                                 const Text('Color : ',
      //                                   style: TextStyle(
      //                                     fontSize: 15,
      //                                     fontWeight: FontWeight.bold,
      //                                   ),
      //
      //                                 ),
      //                                 Text(
      //                                   current.Color,
      //                                   textAlign: TextAlign.justify,
      //                                   style: const TextStyle(
      //                                       // letterSpacing: 0.5,
      //                                       fontSize: 15
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                             SizedBox(
      //                               height: size.height * 0.035,
      //                             ),
      //
      //                             const Text(
      //                                 "SIZE & FIT",
      //
      //                                 style: TextStyle(
      //                                   // letterSpacing: 1,
      //                                   fontWeight: FontWeight.bold,
      //                                   fontSize: 18,
      //                                   // decoration: TextDecoration.underline
      //                                 )
      //                             ),
      //                             SizedBox(
      //                               height: size.height * 0.010,
      //                             ),
      //
      //                             Row(
      //                               children: [
      //
      //                                 const Text('Model height : ',
      //                                   style: TextStyle(
      //                                     fontSize: 15,
      //                                     fontWeight: FontWeight.bold,
      //                                   ),
      //
      //                                 ),
      //                                 Text(
      //                                   current.height,
      //                                   textAlign: TextAlign.justify,
      //                                   style: const TextStyle(
      //                                     fontSize: 15,
      //                                     // letterSpacing: 0.5,
      //
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                             Row(
      //                               children: [
      //
      //                                 const Text('Model Wears : ',
      //                                   style: TextStyle(
      //                                     fontSize: 15,
      //                                     fontWeight: FontWeight.bold,
      //                                   ),
      //
      //                                 ),
      //                                 Text(
      //                                   current.wear,
      //                                   textAlign: TextAlign.justify,
      //                                   style: const TextStyle(
      //                                     // letterSpacing: 0.5,
      //                                       fontSize: 15
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                             SizedBox(height: size.height * 0.020,),
      //                             const Row(
      //                               children: [
      //                                 Text('Note: ',
      //                                   style: TextStyle(
      //                                     fontSize: 15,
      //                                     fontWeight: FontWeight.bold,
      //                                   ),
      //
      //                                 ),
      //                                 Text(
      //                                   "Actual product color may vary slightly from the image.",
      //                                   textAlign: TextAlign.justify,
      //                                   style: TextStyle(
      //                                       letterSpacing: 0.5,
      //                                       fontSize: 15
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                             // Text("Fabric"),
      //                             // Text("Color"),
      //
      //
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //
      //               /// Add To Cart Button
      //               FadeInUp(
      //                 delay: const Duration(milliseconds: 800),
      //                 child: Padding(
      //                   padding: EdgeInsets.only(top: size.height * 0.03),
      //                   child: ReuseableButton(
      //                     text: "Add to cart",
      //                     onTap: () {
      //                       TrouserAddToCart.Trouseraddtocart(current, context);
      //                     },
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: size.height * 0.020,
      //               ),
      //             ],
      //                             ),
      //          ]
      //         ),
      //       ]
      //   ),
      // ),
    // );
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
