import 'package:flutter/material.dart';

import 'SizeConfig.dart';


class newPasswordTextField extends StatelessWidget {

  final String label;
  final TextEditingController? controller;


  newPasswordTextField({
  required this.label ,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: SizeConfig.scaleWidth(20) ,right: SizeConfig.scaleWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom:
                SizeConfig.scaleHeight(8)),
            child: Text(
              label,
              style:
              TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(90),
            child: TextField(
              controller: controller ,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                fillColor: Color(0XFF242627),
                filled: true,
                labelStyle: TextStyle(
                    color: Color(0XFFBFBFC3),
                    fontFamily: 'Poppins',
                    fontSize: SizeConfig
                        .scaleTextFont(16)),
                focusedBorder:
                OutlineInputBorder(
                  borderSide:BorderSide(color: Color(0XFFBFBFC3)) ,
                    borderRadius:
                    BorderRadius
                        .circular(10)),
                enabledBorder:
                OutlineInputBorder(
                    borderSide:BorderSide(color: Color(0XFFBFBFC3)) ,

                    borderRadius:
                    BorderRadius
                        .circular(15)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
