import 'package:flutter/material.dart';
import 'package:vivasvatshashvatiris/home.dart';
import 'package:vivasvatshashvatiris/sliderintroscreens/creators.dart';
import 'package:vivasvatshashvatiris/sliderintroscreens/purpose.dart';

class Last extends StatelessWidget {
  const Last({Key? key}) : super(key: key);
  static const routename = "Lastroute";
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
              "assets/get started.png",
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
                          .pushReplacementNamed(Creators.routename);
                    },
                    child: Text("Previous")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Home.routename);
                    },
                    child: Text("Get Started"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
