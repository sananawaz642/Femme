import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/TrouserModel.dart';
import '../utiles/Constants.dart';
import '../dataApp/data.dart';
import 'details.dart';
import '../product_details/Trouserdetails.dart';


class Trouser extends StatefulWidget{
  const Trouser({super.key});

  @override
  State<Trouser> createState() => TrouserState();
}

class TrouserState extends State<Trouser> {
  late PageController _pageController;
  final int _currentIndex = 2;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: _currentIndex, viewportFraction: 0.7);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Trouser'),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInUp(
                delay: const Duration(milliseconds: 750),
                child: Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  width: size.width,
                  height: size.height * 0.87,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: ShirtList.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.66,
                    ),
                    itemBuilder: (context, index){
                      TrouserModel current = TrouserList[index];
                      return GestureDetector(
                        onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            return TrouserDetails(
                              data2: current,
                              isCameFromMostPopularPart: true,
                            );
                          }),
                        )),
                        child: Hero(
                          tag: current.imageUrl,
                          child: Column(
                            children: [
                              Container(
                                width: size.width * 0.5,
                                height: size.height * 0.3,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  image: DecorationImage(
                                    image: AssetImage(current.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 9.0),
                                child: Text(
                                  current.name,
                                  style: const TextStyle(fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              RichText(

                                  text: TextSpan(
                                      text: "Rs ",
                                      style: textTheme.subtitle2?.copyWith(
                                        color: primaryColor,
                                        fontSize: 18,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: current.price.toString(),
                                          style: textTheme.subtitle2?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ]
                                  )
                              ),
                            ],
                          ),
                        ),

                      );
                    },
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}

