import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:floating_navigation_bar/floating_navigation_bar.dart';
import 'package:vivasvatshashvatiris/macpsvsothers.dart';

class Macvps extends StatefulWidget {
  const Macvps({Key? key}) : super(key: key);
  static const routename = "macvpsroute";
  @override
  _MacvpsState createState() => _MacvpsState();
}

class _MacvpsState extends State<Macvps> {
  int currentIndex = 0;
  late File _image;
  late List _results;
  bool imageSelect = false;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/macpsepretest_model_unquant.tflite",
        labels: "assets/macpsepretestlabels.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      print(_results);
      _image = image;
      imageSelect = true;
    });
  }

  void _showErrorDialogue(String message) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
              title: Text('Image seems to be invalid'),
              content: Text(message),
              actions: [
                ElevatedButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    })
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Assisted Pathology - HCC"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: [
          (imageSelect)
              ? Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.file(_image),
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10),
                  child: const Opacity(
                    opacity: 0.8,
                    child: Center(
                        child: Text(
                      "\n\n\n\nNo image selected",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                ),
          SingleChildScrollView(
            child: Column(
              children: (imageSelect)
                  ? _results.map((result) {
                      return Card(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
                              style: const TextStyle(
                                  color: Colors.redAccent, fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    }).toList()
                  : [],
            ),
          )
        ],
      ),
      bottomNavigationBar: FloatingNavigationBar(
        backgroundColor: Colors.redAccent,
        barHeight: 80.0,
        barWidth: MediaQuery.of(context).size.width - 40.0,
        iconColor: Colors.white,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ),
        iconSize: 20.0,
        indicatorColor: Colors.white,
        indicatorHeight: 5,
        indicatorWidth: 14.0,
        items: [
          NavBarItems(
            icon: Icons.video_camera_front,
            title: "Camera",
          ),
          NavBarItems(
            icon: Icons.image,
            title: "Gallery",
          ),
        ],
        onChanged: (value) {
          currentIndex = value;
          currentIndex == 0 ? pickCamImage() : pickGalImage();
          setState(() {});
        },
      ),
      // FloatingActionButton(
      //   onPressed: pickGalImage,
      //   tooltip: "Pick Image",
      //   child: const Icon(Icons.image),
      // ),
    );
  }

  Future pickGalImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imageClassification(image).then((value) {
      if (_results[0]['index'] == 0 && _results[0]['confidence'] > 0.5) {
        Navigator.of(context)
            .pushNamed(MacpsVSothers.routename, arguments: image);
      } else {
        _showErrorDialogue(
            "The image you have picked seems to belong to classes other than Macrotrabecular and Pseudoglandular. Please ensure that the image entered is not of a no-cancer or other-cancer slide. Presence of other HCC variants is also possible.");
      }
    });

    // if (_results[0]['index'] == 0 && _results[0]['confidence'] > 0.5) {
    //   Navigator.of(context)
    //       .pushNamed(MacmicVothers.routename, arguments: image);
    // } else {
    //   _showErrorDialogue(
    //       "The image you have picked seems to belong to classes other than Macrotrabecular and Microtrabecular. Please ensure that the image entered is not of a no-cancer or other-cancer slide. Presence of other HCC variants is also possible.");
    // }
  }

  Future pickCamImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    File image = File(pickedFile!.path);
    imageClassification(image).then((value) {
      if (_results[0]['index'] == 0 && _results[0]['confidence'] > 0.5) {
        Navigator.of(context)
            .pushNamed(MacpsVSothers.routename, arguments: image);
      } else {
        _showErrorDialogue(
            "The image you have picked seems to belong to classes other than Macrotrabecular and Pseudoglandular. Please ensure that the image entered is not of a no-cancer or other-cancer slide. Presence of other HCC variants is also possible.");
      }
    });
  }
}
