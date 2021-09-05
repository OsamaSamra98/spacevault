import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'package:project_spacevault/change_notifiers/Account_change_notifier.dart';
import 'package:project_spacevault/models/accounts.dart';
import 'package:project_spacevault/screens/UpdatePassword_Screen.dart';
import 'package:project_spacevault/utlis/SizeConfig.dart';
import 'package:project_spacevault/utlis/helpers.dart';
import 'package:project_spacevault/utlis/newPasswordTextField.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DetailPassword_Screen extends StatefulWidget {
  final Account account;

  DetailPassword_Screen(this.account);

  @override
  _DetailPassword_ScreenState createState() => _DetailPassword_ScreenState();
}

class _DetailPassword_ScreenState extends State<DetailPassword_Screen>
    with Helpers {
  late TextEditingController _titleEditingController;
  late TextEditingController _loginEditingController;
  late TextEditingController _passwordEditingController;
  late TextEditingController _websiteEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleEditingController = TextEditingController(text: widget.account.title);
    _loginEditingController =
        TextEditingController(text: widget.account.loginAccount);
    _passwordEditingController =
        TextEditingController(text: widget.account.password);
    _websiteEditingController =
        TextEditingController(text: widget.account.website);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _websiteEditingController.dispose();
    _loginEditingController.dispose();
    _passwordEditingController.dispose();
    _websiteEditingController.dispose();
    super.dispose();
  }

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
          AppLocalizations.of(context)!.detail,
          style: TextStyle(fontSize: SizeConfig.scaleTextFont(18), color: Colors.white),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            color: Color(0Xff242627),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            offset: Offset(-15, 45),
            onSelected: (String selectedItem) {},
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => updatePassword_Screen(account),
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.edit,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0XFF242627), elevation: 0),
                )),
                PopupMenuItem(
                    child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.delete,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0XFF242627), elevation: 0),
                )),
              ];
            },
          ),
        ],
      ),
      backgroundColor: Color(0XFF151718),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.scaleWidth(20), right: SizeConfig.scaleWidth(20), top: SizeConfig.scaleHeight(72)),
                  child: Container(
                    height: SizeConfig.scaleHeight(510),
                    decoration: BoxDecoration(
                        color: Color(0XFF242627),
                        borderRadius: BorderRadius.circular(40)),
                    child: Container(
                      child: Stack(children: [
                        Column(
                          children: [
                            SizedBox(height: SizeConfig.scaleHeight(70)),
                            Column(
                              children: [
                                Text(account.title,
                                    style: TextStyle(
                                        fontSize: SizeConfig.scaleTextFont(18), color: Colors.white)),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(32),
                                ),
                                newPasswordTextField(
                                  label: AppLocalizations.of(context)!.loginAccount,
                                  controller: _loginEditingController,
                                ),
                                newPasswordTextField(
                                  label: AppLocalizations.of(context)!.password,
                                  controller: _passwordEditingController,
                                ),
                                newPasswordTextField(
                                  label: AppLocalizations.of(context)!.website,
                                  controller: _websiteEditingController,
                                ),
                              ],
                            )
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: SizeConfig.scaleHeight(460),
                left: SizeConfig.scaleWidth(147),
                right: SizeConfig.scaleWidth(147),
                child:Container(
                    width: SizeConfig.scaleWidth(80), height: SizeConfig.scaleHeight(80),

                    child: Image.asset('images/${account.title}.png',fit: BoxFit.contain,)),),

          ],
        ),
      ),
    );
  }

  Account get account {
    Account account = widget.account;
    account.title = _titleEditingController.text;
    account.loginAccount = _loginEditingController.text;
    account.password = _passwordEditingController.text;
    account.website = _websiteEditingController.text;
    return account;
  }

  Future deleteAccount(int id, int index) async {
    await Provider.of<AccountChangeNotifier>(context, listen: false).delete(id);
  }
}
