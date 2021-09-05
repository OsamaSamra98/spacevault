import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_spacevault/utlis/ElevatedButton_app.dart';
import 'package:project_spacevault/utlis/SizeConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class menu_Screen extends StatefulWidget {
  const menu_Screen({Key? key}) : super(key: key);

  @override
  _menu_ScreenState createState() => _menu_ScreenState();
}

class _menu_ScreenState extends State<menu_Screen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Color(0XFF151718),
      body: Stack(
        children: [
        Positioned(
          right: SizeConfig.scaleWidth(0),
          top: SizeConfig.scaleHeight(52),
          child:GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/settings_Screen');},
            child: Image.asset(
              'images/setting_button.png',
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.scaleHeight(164),),
            Image.asset('images/space.png'),
            Column(
              children: [

                SizedBox(
                  height: SizeConfig.scaleHeight(112),
                  child:ElevatedButton_app(pic: 'Albums',label: AppLocalizations.of(context)!.albums,),

                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(112),
                  child:ElevatedButton_app(pic:'password' ,label:AppLocalizations.of(context)!.passwords ,onTap: (){Navigator.pushNamed(context, '/home_screen');}),

                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(112),
                  child:ElevatedButton_app(pic: 'cell',label:AppLocalizations.of(context)!.contacts ,),

                ),


              ],
            ),
          ],
        ),


      ],

      ),
    );
  }
}

