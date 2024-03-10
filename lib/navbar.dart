import 'package:femme_style/utiles/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/Shirt.dart';
import '../screens/Trouser.dart';



class NavBar extends StatefulWidget{
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        // padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              },
                // padding: const EdgeInsets.only(bottom: 0),
                icon: const Icon(Icons.cancel),
                iconSize: 30,
              ),
            ),

          ),

          ListTile(
            // leading: Icon(Icons.girl_outlined),
            title: const Text('Shirts'),
            onTap: () => {
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=> const Shirt())
              )
            },
          ),
          ListTile(
            // leading: Icon(Icons),
            title: const Text('Trousers'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> const Trouser())
              )
            },
          ),
          const ListTile(
            title: Text('Pants'),
            // onTap: () => {Navigator.of(context).pop()},
          ),
          const ListTile(
            title: Text('Bags'),
            // onTap: () => {Navigator.of(context).pop()},
          ),
          const ListTile(
            title: Text('Blazer'),
            // onTap: () => {Navigator.of(context).pop()},
          ),
          const ListTile(
            title: Text('Flat'),
            // onTap: () => {Navigator.of(context).pop()},
          ),
          const ListTile(
            title: Text('Ethnic'),
            // onTap: () => {Navigator.of(context).pop()},
          ),

        ],
      ),
      // backgroundColor: Colors.white,
      // child: Row(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     IconButton(onPressed: (){
      //       Navigator.pop(context);
      //     },
      //         padding: const EdgeInsets.all(20),
      //         icon: const Icon(Icons.cancel),
      //       iconSize: 35,
      //      ),
      //
      //   ],
      // ),
    );
  }
}