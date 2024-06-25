// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logaya/core/network/end_points.dart';
import 'package:logaya/view/auth/presentation/view/login.dart';

import 'ViewAttend/table.dart';
import 'core/helper/cach.dart';
import 'face.dart';
import 'finger.dart';

class autho extends StatelessWidget {
  const autho({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
    appBar: AppBar(
    actions: [
    IconButton(onPressed: (){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>  StudentAttendanceScreen(token: '$userToken',),
        ),
            (route) => false,
      );
    }, icon: Icon(Icons.backup_table),color: Colors.black,
    ),
    IconButton(onPressed: (){
      ChachHelper.removeData(key: 'token')!.then((value) => {
        if (value == true)
          {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
                  (route) => false,
            )
          }
      });
    }, icon: Icon(Icons.logout),color: Colors.black,
    ),

    ],
    ),
          body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(255, 120, 143, 185),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              color: Color.fromARGB(255, 119, 153, 177),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "choice for Authorization",
                    style: TextStyle(fontSize: 33, fontFamily: "myfont"),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Image.asset(
                    "assets/images/images-removebg-preview.png.jpg",
                    width: 500,
                    height: 250,
                  ),

                  SizedBox(
                    height: 200,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  FingerprintAuthPage(),
                        ),
                            (route) => false,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 39, 112, 176)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                    ),
                    child: Text(
                      "Finger Print",
                      style: TextStyle(
                          fontSize: 17,
                          color: const Color.fromARGB(255, 252, 252, 252)),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  FaceDetectionScreen(),
                        ),
                            (route) => false,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 39, 112, 176)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 77, vertical: 13)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                    ),
                    child: Text(
                      "Face recogonation",
                      style: TextStyle(
                          fontSize: 17,
                          color: const Color.fromARGB(255, 252, 252, 252)),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: 80,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                "assets/images/main_bottom.png",
                width: 75,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
