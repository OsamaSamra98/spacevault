import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_spacevault/main.dart';
import 'package:project_spacevault/storage/app_pref_controller.dart';
import 'package:project_spacevault/utlis/ElevatedButton_app.dart';
import 'package:project_spacevault/utlis/SizeConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class settings_Screen extends StatefulWidget {
  const settings_Screen({Key? key}) : super(key: key);

  @override
  _settings_ScreenState createState() => _settings_ScreenState();
}

class _settings_ScreenState extends State<settings_Screen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

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
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: SizeConfig.scaleHeight(24),
              ),
              Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.settings,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.scaleTextFont(34)),
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(24),
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(90),
                    child: ElevatedButton_app(
                      pic: 'FaceID',
                      label: AppLocalizations.of(context)!.faceID,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(90),
                    child: ElevatedButton_app(
                      pic: 'passcode',
                      label: AppLocalizations.of(context)!.changePasscode,

                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(90),
                    child: ElevatedButton_app(
                      pic: 'Appearance',
                      label: AppLocalizations.of(context)!.appearance,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(90),
                    child: ElevatedButton_app(
                      pic: 'aboutapp',
                      label: AppLocalizations.of(context)!.aboutapp,
                      onTap: (){Navigator.pushNamed(context, '/about_Screen');},
                    ),
                  ),

                  SizedBox(
                    height: SizeConfig.scaleHeight(90),
                    child: ElevatedButton_app(
                        pic: 'Language',
                        label: AppLocalizations.of(context)!.language,
                        onTap: () {
                          Locale currentLocale = Localizations.localeOf(context) ;
                          String newLocaleLanguage = currentLocale.languageCode == 'ar' ? 'en' :'ar';
                          AppPrefController().setLanguage(newLocaleLanguage);
                          MainApp.changeLanguage(
                              context: context, locale: Locale(newLocaleLanguage));
                        }),
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
