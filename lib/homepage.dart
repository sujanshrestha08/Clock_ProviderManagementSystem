import 'dart:ffi';

import 'package:clockapp/clock_view.dart';
// import 'package:clockapp/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat("HH:mm").format(now);
    var formattedDate = DateFormat("EEE, d MMM").format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              FlatButton(
                  onPressed: () {},
                  child: Column(
                  
                    children: [
                      FlutterLogo(),
                      Text(
                        'Clock',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),),
            ],
            
          ),
          VerticalDivider(
          color: Colors.white,width: 1,),
          Expanded(
            child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                alignment: Alignment.center,
                color: Color(0xFF2D2F41),
                child:
                    // ChangeNotifierProvider(
                    //   create: (context) => ClockInfo(),
                    // child:
                    Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Clock",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      formattedTime,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                    Text(formattedDate,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        )),
                    // RichText(
                    //   text: TextSpan(
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         // fontSize: 18.0,
                    //       ),
                    //       children: <TextSpan>[
                    //         TextSpan(
                    //             text: formattedTime\n,,
                    //             ),
                    //         TextSpan(
                    //             text: "Clock",
                    //             ),
                    //       ]),
                    // ),
                    // Text("Clock", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,),),
                    // Text("Clock", style: TextStyle(),
                    ClockView(),
                    Text(
                      "Timezone",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(height: 10),
          
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16),
                        Text(
                          "UTC" + offsetSign + timezoneString,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
          
                    // RichText(
                    //   text: TextSpan(
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         // fontSize: 18.0,
                    //       ),
                    //       children: <TextSpan>[
                    //         TextSpan(
                    //           text: "Timezone\n\n", style: TextStyle(fontSize: 25,)
                    //         ),
          
                    //         // TextSpan(
                    //         //   text: "Clock", style: TextStyle(fontSize: 18,)
                    //         // ),
                    //       ]),
                    // ),
                  ],
                )
                // ),
                ),
          ),
        ],
      ),
    );
  }
}
