// import 'dart:js';
import 'package:femme_style/screens/home.dart';
import 'package:femme_style/wrapScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const FlutterApp());
}
class FlutterApp extends StatefulWidget{
  const FlutterApp({super.key});

  @override
  State<FlutterApp> createState() => FlutterAppState();
}

class FlutterAppState extends State<FlutterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Mont',
          useMaterial3: true,
        // primarySwatch: Colors.green
      ),
      home: const SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  splashscreen createState() =>splashscreen();
}

class splashscreen extends State<SplashScreen>{

  static const String KEYLOGIN = "Login";
  @override
  void initState() {
    super.initState();
    // Timer( Duration(seconds: 4),(){
    //   Navigator.pushReplacement(context,
    //   MaterialPageRoute(builder:(context)=>DashBoardScreen()
    //   ));
    // });
    WhereToGo(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,
      body:  Container(
        color: Colors.deepOrange,
          child: const Center(child: Text("Femme Style",
            style: TextStyle(color: Colors.white,
                fontFamily: "fontMain",
                fontSize: 45,
                fontWeight: FontWeight.w800
            ),
          )
          ),

          ),
          // color: Colors.white,
        );
  }

}

void WhereToGo( var context) async{
  var sharedPref = await SharedPreferences.getInstance();
  var isLoggedIn = sharedPref.getBool(splashscreen.KEYLOGIN);



  Future.delayed(const Duration(seconds: 4), (){

    if(isLoggedIn!=null){
      if(isLoggedIn){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:(context) => const homeScreen()));
      } else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:(context) => const DashBoardScreen()));
      }
    } else{
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:(context) => const DashBoardScreen()));
    }

  }
  );
}


class DashBoardScreen extends StatefulWidget{
  const DashBoardScreen({super.key});


  @override
  State<DashBoardScreen> createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orange,
        ),
        margin: const EdgeInsets.only(left: 10,right: 10,top: 80),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const Spacer(),
                  const Center(
                    child: Text("Login", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),),
                  ),
                  const Spacer(),
                  const Text("Email",style: TextStyle(color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),),
                  Container(
                    height: 35,
                    decoration:const  BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.transparent))
                    ),
                    child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.mail, color: Colors.white,),
                        // fillColor: Colors.deepOrange,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text("Password", style: TextStyle(color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),),
                  Container(
                    height: 35,
                    decoration:const  BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.transparent))
                    ),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white,),
                      decoration: const InputDecoration(
                        // focusColor: Colors.deepOrange,
                        suffixIcon: Icon(Icons.lock, color: Colors.white,),
                        fillColor: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 0,left: 0),
                        child: Checkbox(
                          value: isChecked,
                          activeColor: Colors.deepOrange,
                          onChanged: (newBool){
                              setState(() {
                                isChecked = newBool;
                              });
                          },
                        ),
                      ),
                      const Expanded(child: Text("Remember me", style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold),)
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 0),
                          child: Expanded(child: TextButton(
                            onPressed: (){

                            },
                            child: const Text("Forget Password",
                            style: TextStyle(color: Colors.purple,
                            decoration: TextDecoration.underline,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                            ),
                          ))
                      )
                    ],
                  ), const Spacer(),

                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      // onPressed: (){
                      //    Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context)=>homeScreen() ));
                      //   },
                      onPressed: () async{
                        var sharedPref = await SharedPreferences.getInstance();
                        sharedPref.setBool(splashscreen.KEYLOGIN, true);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=>const homeScreen() ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent, // Background color
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                      ),
                    )
                  ),
                  // const Spacer(),
                  Container(
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 40),
                            child: const Expanded(child: Text("Don't have a account",
                              style: TextStyle(color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                            )
                            ),
                          ),
                          Expanded(
                              child: TextButton(
                                      onPressed: (){},
                              child: const Text("Register", style: TextStyle(color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),),)
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
        ),
      )
    );
  }
}



