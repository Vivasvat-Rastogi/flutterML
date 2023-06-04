import 'package:flutter/material.dart';
import 'package:vivasvatshashvatiris/home.dart';
import 'package:vivasvatshashvatiris/sliderintroscreens/last.dart';
import 'package:vivasvatshashvatiris/sliderintroscreens/prereq.dart';
import 'package:vivasvatshashvatiris/sliderintroscreens/purpose.dart';

class Creators extends StatelessWidget {
  const Creators({Key? key}) : super(key: key);
  static const routename = "Creatorsroute";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.05,
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Home.routename);
                },
                child: Text(
                  "Skip",
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.80,
            child: Image.asset(
              "assets/creators.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Prereq.routename);
                    },
                    child: Text("Previous")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Last.routename);
                    },
                    child: Text("Next"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
