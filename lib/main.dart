import 'package:flutter/material.dart';
import 'package:vivasvatshashvatiris/home.dart';
import 'package:flutter/services.dart';
import 'package:vivasvatshashvatiris/macmicvsothers.dart';
import 'package:vivasvatshashvatiris/macpsvsothers.dart';
import 'package:vivasvatshashvatiris/macvmic.dart';
import 'package:vivasvatshashvatiris/macvnonTfliteModel.dart';
import 'package:vivasvatshashvatiris/macvnonvsothers.dart';
import 'package:vivasvatshashvatiris/macvps.dart';
import 'package:vivasvatshashvatiris/sliderintroscreens/creators.dart';
import 'package:vivasvatshashvatiris/sliderintroscreens/functioning.dart';
import 'package:vivasvatshashvatiris/sliderintroscreens/last.dart';
import 'package:vivasvatshashvatiris/sliderintroscreens/ml.dart';
import 'package:vivasvatshashvatiris/sliderintroscreens/prereq.dart';
import 'package:vivasvatshashvatiris/sliderintroscreens/purpose.dart';
import 'package:vivasvatshashvatiris/sliderintroscreens/welcome.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.redAccent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Assisted Pathology | HCC',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Welcome(),
      routes: {
        Macvps.routename: (context) => Macvps(),
        Macvmic.routename: (context) => Macvmic(),
        TfliteModel.routename: (context) => TfliteModel(),
        MacmicVothers.routename: (context) => MacmicVothers(),
        MacnonVSothers.routename: (context) => MacnonVSothers(),
        MacpsVSothers.routename: (context) => MacpsVSothers(),
        Welcome.routename: (context) => Welcome(),
        Purpose.routename: ((context) => Purpose()),
        Home.routename: (context) => Home(),
        Functioning.routename: (context) => Functioning(),
        Prereq.routename: (context) => Prereq(),
        ML.routename: (context) => ML(),
        Creators.routename: (context) => Creators(),
        Last.routename: (context) => Last(),
      },
    );
  }
}
