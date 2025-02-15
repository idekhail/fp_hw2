
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sText = 'Show';
  final userController = TextEditingController();
  final passController = TextEditingController();
  void getText() {
    setState(() {
      sText = userController.text + '     ' + passController.text;
    });
  }
  void setClear() {
    setState(() {
      sText = 'Show';
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: 60,
              width: 400,
              color: Colors.blueGrey,
              alignment: AlignmentDirectional(BorderSide.strokeAlignCenter,0),
              child: Text('Home Page', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
                fontStyle: FontStyle.italic, ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.all(10),
            //   height: 60,
            //   width: 400,
            //     color: Colors.blueGrey,
            //     alignment: AlignmentDirectional(BorderSide.strokeAlignCenter,0),
            //     child: const Text.rich(
            //       TextSpan(
            //         children: <TextSpan>[
            //           TextSpan(text: 'Home Page', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),
            //         ],
            //       ),
            //     )
            // ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              color: Colors.black26 ,
              child: Column(
                children:[
                  TextField(
                    controller: userController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20))),
                        hintText: 'Username',
                        hintStyle: TextStyle(fontSize: 20)
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: passController,
                    obscureText: true,   // hide text for password  ***
                    decoration: InputDecoration(
                        filled: true,   // background color will be change to white color
                        fillColor: Colors.white,   // background will be white color
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        labelText: 'Password'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              height: 150,
              width: 400,
              color: Colors.red,
              alignment: AlignmentDirectional(BorderSide.strokeAlignCenter, 0),
              child: Text(
                '$sText',
                style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              height: 150,
              width: 400,
              color: Colors.black45,
              alignment: AlignmentDirectional(BorderSide.strokeAlignCenter, 0),
              child: Row(
                children: [
                  OutlinedButton(
                    child: Text(
                      "OK",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30
                      ),
                    ),
                    onPressed: () {
                      getText();
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setClear();
                      userController.text ='';
                      passController.text='';
                    },
                    // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                    style: ElevatedButton.styleFrom(
                        elevation: 12.0,
                        textStyle: const TextStyle(color: Colors.white)),
                    child: const Text('CLEAR'),
                  ),
                  CloseButton(
                    onPressed: () {
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    onPressed: ()=> exit(0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
