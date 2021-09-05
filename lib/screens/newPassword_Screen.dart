import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_spacevault/utlis/SizeConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_spacevault/utlis/newPasswordCard.dart';

class newPassword_Screen extends StatefulWidget {
  const newPassword_Screen({Key? key}) : super(key: key);

  @override
  _newPassword_ScreenState createState() => _newPassword_ScreenState();
}

class _newPassword_ScreenState extends State<newPassword_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF151718),
      appBar: AppBar(
        leading: InkWell(
            child: RotatedBox(
              quarterTurns: 0,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            }),
        title:Text(
          AppLocalizations.of(context)!.newPassword,
          style:
          TextStyle(fontSize: 18, color: Colors.white),
        ),
        actions: [InkWell(child: Image.asset('images/searchButton.png'),onTap: (){},)],
      ),

      body: newPasswordCard(),
    );
  }
}
