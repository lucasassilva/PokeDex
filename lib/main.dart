import 'package:flutter/material.dart';
import 'package:pokedex_tarde/core/app_theme.dart';
import 'package:pokedex_tarde/pages/home_page.dart';
import 'core/app_const.dart';

void main() {
  runApp(new MaterialApp(
   debugShowCheckedModeBanner: false,
   title: kAppTitle,
   theme: kAppTheme,
   home: _SplashScreen(),
  ));
}

class _SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<_SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {    
     return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blueAccent,
            Colors.redAccent
          ],  
        ),
       ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
          'PokeDex',
           style: TextStyle(
              fontSize: 36.0,
              decoration: TextDecoration.none,
              color: Colors.white,
              fontWeight: FontWeight.bold,
           ),
        ),
        SizedBox(height: 50),
        Center(
          child: SizedBox(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
            ),
            height: 50,
            width: 50,
          ),
         ),
        ],
      )
    ); 
  }

}



