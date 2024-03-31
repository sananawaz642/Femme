import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';


import '../models/CategoriesModel.dart';
import '../models/BaseModel.dart';
import '../screens/details.dart';
import '../dataApp/data.dart';


class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FadeInUp(
                delay: const Duration(milliseconds: 450),
                child: Container(
                  margin: const EdgeInsets.only(top: 7),
                  width: size.width,
                  height: size.height * 0.20,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (ctx, index) {
                        CategoriesModel current = categories[index];
                        return  Padding(
                          padding: const EdgeInsets.all(10.0),
                          // child: Row(
                          //   crossAxisAlignment: CrossAxisAlignment.stretch,
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //
                          //   children:[
                          //     Column(
                          //     children: [
                          //       InkWell(
                          //         // onTap: () {},
                          //         child: (
                          //         CircleAvatar(
                          //           radius: 35,
                          //           backgroundImage: AssetImage('assets/ImagesAll/shirt1.jpg'),
                          //         )
                          //         ),
                          //       ),
                          //       Text("Shirt"),
                          //     ],
                          //   ),
                          //     Column(
                          //       children: [
                          //         InkWell(
                          //           // onTap: () {},
                          //           child: (
                          //               CircleAvatar(
                          //                 radius: 35,
                          //                 backgroundImage: AssetImage('assets/ImagesAll/flat1.jpg'),
                          //               )
                          //           ),
                          //         ),
                          //         Text("Flat"),
                          //       ],
                          //     ),
                          //     Column(
                          //       children: [
                          //         InkWell(
                          //           // onTap: () {},
                          //           child: (
                          //               CircleAvatar(
                          //                 radius: 35,
                          //                 backgroundImage: AssetImage('assets/ImagesAll/trouser1.jpg'),
                          //               )
                          //           ),
                          //         ),
                          //         Text("Trouser"),
                          //       ],
                          //     ),
                          //     Column(
                          //       children: [
                          //         InkWell(
                          //           // onTap: () {},
                          //           child: (
                          //               CircleAvatar(
                          //                 radius: 35,
                          //                 backgroundImage: AssetImage('assets/ImagesAll/ethnic1.jpg'),
                          //               )
                          //           ),
                          //         ),
                          //         Text("Ethnic"),
                          //       ],
                          //     ),
                          //     Column(
                          //       children: [
                          //         InkWell(
                          //           // onTap: () {},
                          //           child: (
                          //               CircleAvatar(
                          //                 radius: 35,
                          //                 backgroundImage: AssetImage('assets/ImagesAll/blazer1.jpg'),
                          //               )
                          //           ),
                          //         ),
                          //         Text("Blazer"),
                          //       ],
                          //     ),
                          //     Column(
                          //       children: [
                          //         InkWell(
                          //           // onTap: () {},
                          //           child: (
                          //               CircleAvatar(
                          //                 radius: 35,
                          //                 backgroundImage: AssetImage('assets/ImagesAll/bag1.jpg'),
                          //               )
                          //           ),
                          //         ),
                          //         Text("bag"),
                          //       ],
                          //     ),
                          //     Column(
                          //       children: [
                          //         InkWell(
                          //           // onTap: () {},
                          //           child: (
                          //               CircleAvatar(
                          //                 radius: 35,
                          //                 backgroundImage: AssetImage('assets/ImagesAll/sneaker1.jpg'),
                          //               )
                          //           ),
                          //         ),
                          //         Text("Sneaker"),
                          //       ],
                          //     ),
                          //
                          //   ]
                          // )
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(current.ImageURL),
                              ),
                              SizedBox(
                                height: size.height * 0.001,
                              ),
                              Text(
                                current.Title,
                                style: textTheme.subtitle1,
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                ),
              ),

              FadeInUp(
                delay: const Duration(milliseconds: 650),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0,
                    vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Most Popular",
                          style: TextStyle(color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold) ,),
                        // Text("See All", style: textTheme.headline6,)
                      ],
                    ),
                  )
              ),


              FadeInUp(

                delay: const Duration(milliseconds: 750),
                  child: SingleChildScrollView(
                    child: Container(
                      // margin: const EdgeInsets.only(top: 10.0),
                      width: size.width,
                      height: size.height * 0.62,
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: mainList.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.63,
                          ),
                          itemBuilder: (context, index){
                          BaseModel current = mainList[index];
                          return GestureDetector(
                              onTap: (() => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              return Details(
                                data: current,
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
                                      padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    current.name,
                                    style: const TextStyle(fontSize: 15,
                                    color: Colors.black),
                                  ),
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "Rs ",
                                          style: textTheme.subtitle2?.copyWith(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
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
                    ),
                  )
              ),
            ],
          ),
        ),
      );
  }
}
