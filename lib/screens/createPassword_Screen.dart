import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_spacevault/change_notifiers/Account_change_notifier.dart';
import 'package:project_spacevault/models/accounts.dart';
import 'package:project_spacevault/screens/home_Screen.dart';
import 'package:project_spacevault/utlis/ListCard.dart';
import 'package:project_spacevault/utlis/SizeConfig.dart';
import 'package:project_spacevault/utlis/helpers.dart';
import 'package:project_spacevault/utlis/newPasswordTextField.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class createPassword_Screen extends StatefulWidget {
  String cardId, image , title;
  createPassword_Screen({
    required this.cardId,
    required this.image,
    required this.title,

  });
  @override
  _createPassword_ScreenState createState() => _createPassword_ScreenState();
}

class _createPassword_ScreenState extends State<createPassword_Screen>
    with Helpers {
  late TextEditingController _titleEditingController;
  late TextEditingController _loginEditingController;
  late TextEditingController _passwordEditingController;
  late TextEditingController _websiteEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleEditingController = TextEditingController(text: widget.title);
    _loginEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    _websiteEditingController = TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _websiteEditingController.dispose();
    _loginEditingController.dispose();
    _passwordEditingController.dispose();
    _websiteEditingController.dispose();
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
              Navigator.pushReplacementNamed(context, '/home_screen');
            }),
        title: Text(
          AppLocalizations.of(context)!.newPassword,
          style: TextStyle(
              fontSize: SizeConfig.scaleTextFont(18), color: Colors.white),
        ),
      ),
      backgroundColor: Color(0XFF151718),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.scaleWidth(20),
                      right: SizeConfig.scaleWidth(20),
                      top: SizeConfig.scaleHeight(72)),
                  child: Container(
                    height: SizeConfig.scaleHeight(640),
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
                                newPasswordTextField(
                                  label: AppLocalizations.of(context)!.title,
                                  controller: _titleEditingController,
                                ),
                                newPasswordTextField(
                                  label: AppLocalizations.of(context)!
                                      .loginAccount,
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
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.scaleWidth(30),
                                      right: SizeConfig.scaleWidth(30)),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      performSave();
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.save,
                                      style: TextStyle(
                                          color: Colors.black,
                                          letterSpacing: 2),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0XFF72D5FF),
                                        minimumSize: Size(double.infinity, 60),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(30))),
                                  ),
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
              bottom: SizeConfig.scaleHeight(600),
              left: SizeConfig.scaleWidth(147),
              right: SizeConfig.scaleWidth(147),
              child: Container(
                  width: SizeConfig.scaleWidth(80),
                  height: SizeConfig.scaleHeight(80),
                  child: Image.asset(widget.image, fit: BoxFit.contain,)),
            ),
            Positioned(
                right: SizeConfig.scaleWidth(171),
                left: SizeConfig.scaleWidth(171),
                bottom: SizeConfig.scaleHeight(580),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/newPassword_Screen');
                    },
                    child: Image.asset('images/Group 4.png'))),
          ],
        ),
      ),
    );
  }

  Future performSave() async {
    if (checkData()) {
      await saveAccount();
    }
  }

  bool checkData() {
    if (_titleEditingController.text.isNotEmpty &&
        _loginEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty &&
        _websiteEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, AppLocalizations.of(context)!.enterRequireddata,
        error: true);

    return false;
  }

  Future saveAccount() async {
    bool inserted =
    await Provider.of<AccountChangeNotifier>(context, listen: false)
        .create(account);
    if (inserted) {
      showSnackBar(context, AppLocalizations.of(context)!.accountsaved);
      clear();
    } else {
      showSnackBar(context, AppLocalizations.of(context)!.failedtoSave,
          error: true);
    }
  }

  Account get account {
    Account account = Account();
    account.title = _titleEditingController.text;
    account.loginAccount = _loginEditingController.text;
    account.password = _passwordEditingController.text;
    account.website = _websiteEditingController.text;
    return account;
  }

  void clear() {
    _titleEditingController.text = '';
    _loginEditingController.text = '';
    _passwordEditingController.text = '';
    _websiteEditingController.text = '';
  }
}
