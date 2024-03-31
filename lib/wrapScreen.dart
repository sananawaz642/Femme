import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:femme_style/navbar.dart';
import 'package:line_icons/line_icons.dart';
import '../screens/search.dart';
import '../screens/home.dart';
import '../screens/cart.dart';



class homeScreen extends StatefulWidget{
  const homeScreen({super.key});

  @override
  homeScreenpage createState() =>homeScreenpage();
}

class homeScreenpage extends State<homeScreen>{
  final int _index = 0;
  bool isSearchActive = false;

  List<Widget> screens = [
    const Home(),
    const Search(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(

        title: isSearchActive
            ? FadeIn(
          delay: const Duration(milliseconds: 300),
              child: const Text(
            "Search",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        )
            : FadeIn(
          delay: const Duration(milliseconds: 300),
              child: const Text(
            "Femme Style",
            style: TextStyle(
                fontSize: 23,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchActive = !isSearchActive;
              });
            },
            icon: isSearchActive
                ? const Icon(
              LineIcons.searchMinus,
              color: Colors.black,
              size: 30,
            )
                : const Icon(
              LineIcons.search,
              color: Colors.black,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                LineIcons.shoppingBag,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Cart(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: const Home()
    );
  }

}


