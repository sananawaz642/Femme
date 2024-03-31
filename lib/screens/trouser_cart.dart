import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';

import '../models/TrouserModel.dart';
import '../dataApp/data.dart';
import '../widget/reuseable_row_for_cart.dart';
import '../widget/reuseable_button.dart';
import '../utils/Constants.dart';
import '../wrapScreen.dart';



class TrouserCart extends StatefulWidget {
  const TrouserCart({super.key});

  @override
  State<TrouserCart> createState() => _TrouserCartState();
}


class _TrouserCartState extends State<TrouserCart> {
  /// Calculate the Total Price
  double calculateTotalPrice() {
    double total = 0.0;
    if (trouseritemsOnCart.isEmpty) {
      total = 0;
    } else {
      for (TrouserModel data2 in trouseritemsOnCart) {
        total = total + data2.price * data2.value;
      }
    }
    return total;
  }

  /// Calculate Shipping
  double calculateShipping() {
    double shipping = 0.0;
    if (trouseritemsOnCart.isEmpty) {
      shipping = 0.0;
      return shipping;
    } else if (trouseritemsOnCart.length <= 4) {
      shipping = 150.0;
      return shipping;
    } else {
      shipping = 190.0;
      return shipping;
    }
  }

  /// Calculate the Sub Total Price
  int calculateSubTotalPrice() {
    int subTotal = 0;
    if (trouseritemsOnCart.isEmpty) {
      subTotal = 0;
    } else {
      for (TrouserModel data2 in trouseritemsOnCart) {
        subTotal = subTotal + data2.price.round();
        subTotal = subTotal - 160;
      }
    }
    return subTotal < 0 ? 0 : subTotal;
  }

  /// delete function for cart
  void onDelete(TrouserModel data2) {
    setState(() {
      if (trouseritemsOnCart.length == 1) {
        trouseritemsOnCart.clear();
      } else {
        trouseritemsOnCart.removeWhere((element) => element.id == data2.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.6,
              child: trouseritemsOnCart.isEmpty

              /// List is Empty:
                  ? Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 200),
                    child: const Image(
                      image: AssetImage("assets/ImagesAll/empty.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 250),
                    child: const Text(
                      "Your cart is empty right now :(",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 300),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const homeScreen()));
                      },
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )

              /// List is Not Empty:
                  : ListView.builder(
                  scrollDirection: Axis.vertical,
                  // physics: const BouncingScrollPhysics(),
                  itemCount: trouseritemsOnCart.length,
                  itemBuilder: (context, index) {
                    var current = trouseritemsOnCart[index];
                    return FadeInUp(
                      delay: Duration(milliseconds: 100 * index + 80),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: size.width,
                        height: size.height * 0.21,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 4,
                                    // color: Colors.grey
                                    color: Color.fromARGB(61, 0, 0, 0),
                                  )
                                ],
                                // color: Colors.pink,
                                image: DecorationImage(
                                    image: AssetImage(current.imageUrl),
                                    fit: BoxFit.cover),
                              ),
                              width: size.width * 0.4,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.52,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          current.name,
                                          style:
                                          const TextStyle(fontSize: 18),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              onDelete(current);
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.grey,
                                            ))
                                      ],
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "Rs ",
                                          style:
                                          textTheme.subtitle2?.copyWith(
                                            fontSize: 20,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: current.price.toString(),
                                              style:
                                              textTheme.subtitle2?.copyWith(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ])),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    "Size = ${sizes[3]}",
                                    style: textTheme.subtitle2?.copyWith(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: size.height * 0.020,
                                    ),
                                    width: size.width * 0.4,
                                    height: size.height * 0.04,
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(4.0),
                                          width: size.width * 0.065,
                                          height: size.height * 0.045,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.grey),
                                          ),
                                          child: InkWell(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            onTap: () {
                                              setState(() {
                                                if (current.value > 1) {
                                                  current.value = 1;
                                                  current.value--;
                                                } else {
                                                  onDelete(current);
                                                  current.value = 1;
                                                }
                                              });
                                            },
                                            child: const Icon(
                                              Icons.remove,
                                              size: 16,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                              size.width * 0.02),
                                          child: Text(
                                            current.value.toString(),
                                            style: textTheme.subtitle2
                                                ?.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(4.0),
                                          width: size.width * 0.065,
                                          height: size.height * 0.045,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          child: InkWell(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            onTap: () {
                                              setState(() {
                                                current.value >= 0
                                                    ? current.value++
                                                    : null;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.add,
                                              size: 16,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),

            /// Bottom Card
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.40,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 12.0),
                  child: Column(
                    children: [

                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 400),
                        child: ReuseableRowForCart(
                          price: calculateSubTotalPrice().toDouble(),
                          text: 'Sub Total',
                        ),
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 450),
                        child: ReuseableRowForCart(
                          price: calculateShipping(),
                          text: 'Shipping',
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Divider(),
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: ReuseableRowForCart(
                          price: calculateTotalPrice(),
                          text: 'Total',
                        ),
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 550),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: ReuseableButton(
                              text: "Checkout",
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const TrouserCart()));
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "My Cart",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            LineIcons.user,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
