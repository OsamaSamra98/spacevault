import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_spacevault/utlis/SizeConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class about_Screen extends StatefulWidget {
  const about_Screen({Key? key}) : super(key: key);

  @override
  _about_ScreenState createState() => _about_ScreenState();
}

class _about_ScreenState extends State<about_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          AppLocalizations.of(context)!.aboutapp,
          style: TextStyle(fontSize: SizeConfig.scaleTextFont(18), color: Colors.white),
        ),
      ),

      backgroundColor: Color(0XFF151718),
      
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,


        children: [

          Divider(),
          Image.asset('images/space.png'),
          SizedBox(height: SizeConfig.scaleHeight(20),),
          Text('Osama Abo Samra',style: TextStyle(fontSize: 30,color: Colors.grey.shade300,fontWeight: FontWeight.bold),),
          SizedBox(height: SizeConfig.scaleHeight(10),),
          Text('GGateway - Flutter',style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),

        ],
      
      ),

    );
  }
}
