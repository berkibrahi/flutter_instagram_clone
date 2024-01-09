import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/homepage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePge(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.3),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Colors.amber,
                        Colors.pink,
                        Colors.purple,
                      ],
                      center: Alignment.bottomCenter,
                      radius: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Container(
                  width: 83,
                  height: 83,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.pink, width: 8)),
                ),
                Positioned(
                  top: 17,
                  right: 17,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.pinkAccent),
                  ),
                )
              ],
            )),
        Text(
          'from',
          style: GoogleFonts.quicksand(fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.fromString('infinity'),
                color: Colors.pink,
                size: 40,
              ),
              Text(
                'Meta',
                style: GoogleFonts.kanit(
                  color: Colors.pink,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
