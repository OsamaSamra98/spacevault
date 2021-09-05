import 'package:flutter/material.dart';

import 'SizeConfig.dart';

class ElevatedButton_app extends StatelessWidget {
  final String label;

  final String pic;
  final VoidCallback? onTap;

  ElevatedButton_app({
   required this.label,
   required this.pic,
    this.onTap ,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.scaleWidth(20), right: SizeConfig.scaleWidth(20), bottom: SizeConfig.scaleHeight(16), top: SizeConfig.scaleHeight(0)),
      child: ElevatedButton(
        onPressed: onTap ,
        child: Padding(
          padding:  EdgeInsets.only(left: SizeConfig.scaleWidth(20), top: SizeConfig.scaleHeight(20), bottom: SizeConfig.scaleHeight(20)),
          child: Row(
            children: [
              Image.asset('images/$pic.png'),
              SizedBox(
                width: SizeConfig.scaleWidth(40),
              ),
              Text(
                label ,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: SizeConfig.scaleTextFont(18),color: Colors.white),
              ),
              Spacer(),
              // IconButton(onPressed: onTap , icon: Image.asset('images/Arrow.png')),

            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: Color(0XFF242627),
            minimumSize: Size(double.infinity, 335),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35))),
      ),
    );
  }
}
