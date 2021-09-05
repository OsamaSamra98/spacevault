import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class launch_Screen extends StatefulWidget {
  const launch_Screen({Key? key}) : super(key: key);

  @override
  _launch_ScreenState createState() => _launch_ScreenState();
}

class _launch_ScreenState extends State<launch_Screen> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/menu_Screen');

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF151718),
      
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Divider(),
          Image.asset('images/space.png')
        ],
      
      ),

    );
  }
}
