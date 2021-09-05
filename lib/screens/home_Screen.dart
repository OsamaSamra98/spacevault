import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_spacevault/change_notifiers/Account_change_notifier.dart';
import 'package:project_spacevault/models/accounts.dart';
import 'package:project_spacevault/screens/DetailPassword_Screen.dart';
import 'package:project_spacevault/screens/UpdatePassword_Screen.dart';
import 'package:project_spacevault/screens/createPassword_Screen.dart';
import 'package:project_spacevault/utlis/SizeConfig.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class home_Screen extends StatefulWidget {



  @override
  _home_ScreenState createState() => _home_ScreenState();

}

class _home_ScreenState extends State<home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF151718),
      appBar: AppBar(
        elevation: 0,
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
              Navigator.pushReplacementNamed(context, '/menu_Screen');
            }),
        title: Text(AppLocalizations.of(context)!.passwords),
        actions: [
          InkWell(
            child: Image.asset('images/add.png'),
            onTap: () {
              Navigator.pushNamed(context, '/newPassword_Screen');
            },
          )
        ],
      ),
      body: Consumer<AccountChangeNotifier>(
        builder: (
            BuildContext context,
            AccountChangeNotifier value,
            Widget? child,
            ) {
          if (value.accounts.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/lock.png'),
                SizedBox(
                  height: SizeConfig.scaleHeight(15),
                ),
                Text(
                  AppLocalizations.of(context)!.nopassword,
                  style: TextStyle(
                      fontSize: SizeConfig.scaleTextFont(18),
                      color: Colors.white),
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(7),
                ),
                Text(
                  AppLocalizations.of(context)!.donthaveyet,
                  style: TextStyle(
                      fontSize: SizeConfig.scaleTextFont(14),
                      color: Color(0XFFBFBFC3)),
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(32),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.scaleWidth(27),
                      right: SizeConfig.scaleWidth(27)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/newPassword_Screen');
                    },
                    child: Text(
                      AppLocalizations.of(context)!.create,
                      style: TextStyle(color: Colors.black, letterSpacing: 2),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0XFF72D5FF),
                        minimumSize: Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ],
            );
          }
          return ListView.builder(
              itemCount: value.accounts.length,
              itemBuilder: (context, index) {
                Account account = value.accounts[index];

                return Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.scaleWidth(20),
                      right: SizeConfig.scaleWidth(32),
                      bottom: SizeConfig.scaleHeight(14)),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0XFF242627),
                    elevation: 0,
                    child: SizedBox(
                      height: SizeConfig.scaleHeight(72),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPassword_Screen(account),
                            ),
                          );
                        },
                        onLongPress: () {},
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Image.asset('images/${account.title}.png'),
                              SizedBox(
                                width: SizeConfig.scaleWidth(26),
                              ),
                              Text(
                                account.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.scaleTextFont(16),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () async {
                                    await deleteAccount(account.id, index);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.blue,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  Future deleteAccount(int id, int index) async {
    await Provider.of<AccountChangeNotifier>(context, listen: false).delete(id);
  }
}
