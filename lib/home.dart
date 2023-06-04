import 'package:flutter/material.dart';
import 'package:vivasvatshashvatiris/macvmic.dart';
import 'package:vivasvatshashvatiris/macvnonTfliteModel.dart';
import 'package:vivasvatshashvatiris/macvps.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const routename = "homeroute";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/homeimge.png",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  color: Colors.redAccent,
                  height: MediaQuery.of(context).size.height * 0.165,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Macvmic.routename);
                              },
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 160,
                                  height: 100,
                                  color: Colors.white,
                                  child: const Text(
                                    "Macrotrabecular vs\nMicrotrabecular",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(TfliteModel.routename);
                              },
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 160,
                                  height: 100,
                                  color: Colors.white,
                                  child: const Text(
                                    "Macrotrabecular vs\nNon-Macrotrabecular",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Macvps.routename);
                              },
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: 160,
                                  height: 100,
                                  color: Colors.white,
                                  child: const Text(
                                    "Macrotrabecular vs\nPseudoglandular",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
