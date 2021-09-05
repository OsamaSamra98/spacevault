import 'package:flutter/material.dart';

import 'SizeConfig.dart';

class newPasswordCard3 extends StatelessWidget {
  final String title;
  final String pic;

  newPasswordCard3({
    required this.title,
    required this.pic,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: SizedBox(
        height: SizeConfig.scaleHeight(80),
        child: Padding(
          padding:  EdgeInsets.only(bottom: 10, left: 0, right: 0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Color(0XFF242627),
            child: SizedBox(
              height: SizeConfig.scaleHeight(72),
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding:  EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Image.asset('images/$pic.png'),
                      SizedBox(
                        width: SizeConfig.scaleWidth(26),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.scaleTextFont(16),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
