import 'package:flutter/material.dart';
import 'package:project_spacevault/screens/createPassword_Screen.dart';

import 'ListCard.dart';
import 'SizeConfig.dart';

class newPasswordCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return ListView.builder(
    itemCount: Card_DATA.length,
    itemBuilder: (context, index) {
      return Padding(
        padding:  EdgeInsets.only(bottom: 10, left: 30, right: 30),
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Color(0XFF242627),
          child: SizedBox(
            height: SizeConfig.scaleHeight(72),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => createPassword_Screen(
                          image: Card_DATA[index]['image']!,
                          cardId: Card_DATA[index]['id']!,
                          title:Card_DATA[index]['title']!,

                        )));

                // Navigator.pushNamed(context, DetailsProductScreen.id);
              },
              child: Padding(
                padding:  EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Image.asset(Card_DATA[index]['image']!),
                    SizedBox(
                      width: SizeConfig.scaleWidth(26),
                    ),
                    Text(
                      Card_DATA[index]['title']!,
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
      );

    },
  );
}
